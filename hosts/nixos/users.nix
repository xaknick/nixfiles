{ ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xaknick = {
    isNormalUser = true;
    description = "xaknick";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
