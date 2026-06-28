{ pkgs ? import <nixpkgs> { config.allowUnfree = true; } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    terraform
    openstackclient
    apacheHttpd
  ];

  shellHook = ''
    echo "Terraform и OpenStack client установлены."
    echo "Проверка версий:"
    export TF_CLI_CONFIG_FILE="$PWD/terraform-demo/terraform.rc"
    echo "Terraform CLI config: $TF_CLI_CONFIG_FILE"
    terraform version
    openstack --version
  '';
}
