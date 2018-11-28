Return-Path: virtio-comment-return-571-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6162985C57
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Nov 2018 03:41:11 +0000 (UTC)
MIME-Version: 1.0
From: Steven Anderson <wanfuse123@gmail.com>
Date: Tue, 27 Nov 2018 22:40:59 -0500
Message-ID: <CAGBwPuDvyx-AwtfH12pVjd0-uH+vESqSLds8vWD-eRdbuRWkCQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000047dab2057bb156f7"
Subject: [virtio-comment] WinRE (Windows Bare Metal Recovery) and Veeam
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--00000000000047dab2057bb156f7
Content-Type: text/plain; charset="UTF-8"

Hi!

Anyone ever get the Windows WinRE or the Veeam Bare Metal recovery disk to
properly load the virtio drivers and see the KVM virtio interfaces inside a
guest.

That is, I have used DISM to integrate the virtio drivers for the network
and disk in it after extracting it from the Windows disk or from the veeam
disk.
Dism completes the install without error, and shows the driver there but
when I boot the virtual machine from the WinRE / Veeam disk it does not see
any interfaces, booting the same VM from the Ubuntu disk sees the virtio
interfaces.

I also have tried using drvload to load them on the virtual machine after
booting from the WinRE/Veeam disk and it errors out with a missing ID error
"ERROR_NO_DEVICE_ID.


Anyone able to help?

Regards,


Steven Anderson

--00000000000047dab2057bb156f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi!</div><div><br></div><div>Anyone ever get the Wind=
ows WinRE or the Veeam Bare Metal recovery disk to properly load the virtio=
 drivers and see the KVM virtio interfaces inside a guest.</div><div><br></=
div><div>That is, I have used DISM to integrate the virtio drivers for the =
network and disk in it after extracting it from the Windows disk or from th=
e veeam disk. <br></div><div>Dism completes the install without error, and =
shows the driver there but when I boot the virtual machine from the WinRE /=
 Veeam disk it does not see any interfaces, booting the same VM from the Ub=
untu disk sees the virtio interfaces.</div><div><br></div><div>I also have =
tried using drvload to load them on the virtual machine after booting from =
the WinRE/Veeam disk and it errors out with a missing ID error &quot;ERROR_=
NO_DEVICE_ID.</div><div><br></div><div><br></div><div>Anyone able to help?<=
/div><div><br></div><div>Regards,</div><div><br></div><div><br></div><div>S=
teven Anderson<br></div></div>

--00000000000047dab2057bb156f7--
