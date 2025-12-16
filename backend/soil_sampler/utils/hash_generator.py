import hashlib


def generate_hash(project_no, sample_no, location, top_depth):
    top_depth_formatted = "{:.3f}".format(float(top_depth))
    hash_input = f"{project_no}{sample_no}{location}{top_depth_formatted}"
    return hashlib.sha256(hash_input.encode()).hexdigest()