import React, { useRef } from "react";
import QRCode from "qrcode.react";
import "../print.css";
import { notifyError } from "./notify";

const QrCodeModel = ({ sample, handleClose }) => {
  const qrCodeRef = useRef();
  const handlePrintClick = () => {
    const printWindow = window.open("", "_blank");
    printWindow.document.write(
      `<html><head><title>Print QR Code</title></head><body>` //<h3>QR Code for ${sample?.sample_user_no}</h3>
    );

    const qrCodeCanvas = qrCodeRef.current.querySelector("canvas");
    const qrCodeDataUri = qrCodeCanvas.toDataURL("image/jpg", 0.3);
    if (qrCodeDataUri) {
      const imgElement = document.createElement("img");
      imgElement.src = qrCodeDataUri;

      // Wait for the image to load before printing
      imgElement.onload = () => {
        printWindow.document.body.appendChild(imgElement);

        printWindow.document.write("</body></html>");
        printWindow.document.close();
        printWindow.print();
        printWindow.close();
      };

      imgElement.onerror = () => {
        notifyError("qr-error", "Error loading QR code image");
        printWindow.close();
      };
    } else {
      console.error("QR code data URI is empty");
      printWindow.close();
    }
  };

  return (
    <dialog id="my_modal_2" className={`modal modal-open backdrop-blur px-2 `}>
      <div className="modal-box dark:bg-zinc-100  w-full lg:w-3/12 max-w-5xl no-scrollbar">
        <div className="flex flex-col justify-center items-center gap-3">
          <h3 className="text-gray-900 font-bold">QR Code</h3>
          <div id="print" ref={qrCodeRef}>
            <QRCode
              value={`Project No: ${sample?.project_no}\nLocation: ${sample?.location}\nSample No: ${sample?.sample_no}\nTop Depth: ${sample?.top_depth}`}
            />
          </div>
          <div className="flex flex-row justify-center items-center gap-3">
            <button
              className="btn bg-blue-400 text-white"
              onClick={handlePrintClick}
            >
              Print
            </button>
            <button
              className="btn bg-red-400 text-white"
              onClick={() => handleClose(false)}
            >
              Close
            </button>
          </div>
        </div>
      </div>
    </dialog>
  );
};

export default QrCodeModel;
