Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1
$Env:PIP_INDEX_URL = "https://mirror.baidu.com/pypi/simple"
$Env:HF_ENDPOINT = "https://hf-mirror.com"

if (!(Test-Path -Path "venv")) {
    Write-Output  "����python���⻷��venv..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "��װ����..."
pip install -U -r requirements-windows.txt
pip install .

Write-Output  "����ģ��..."
huggingface-cli download --resume-download fudan-generative-ai/hallo --local-dir pretrained_models --local-dir-use-symlinks False


Write-Output "��װ���"
Read-Host | Out-Null ;
