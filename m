Return-Path: <virtio-comment-return-3589-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82EF0986366
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Dec 2022 12:22:22 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <6e88d56dd4074402afbd23e2fbb48c98@huawei.com>
References: <20220913065358.12152-1-zhukeqian1@huawei.com>
 <6e88d56dd4074402afbd23e2fbb48c98@huawei.com>
Date: Mon, 19 Dec 2022 13:22:15 +0100
Message-ID: <87a63jmvm0.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: =?utf-8?B?562U5aSNOg==?= [virtio-comment][PATCH v2] pci: Update
 ISR related
 description about MSI-X
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: zhukeqian <zhukeqian1@huawei.com>, zhukeqian <zhukeqian1@huawei.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "mst@redhat.com" <mst@redhat.com>, "Wanghaibin (D)" <wanghaibin.wang@huawei.com>, "sundongxu (A)" <sundongxu3@huawei.com>, "Chentao (Boby)" <boby.chen@huawei.com>, "Zhangbo (Oscar)" <oscar.zhangbo@huawei.com>, zhukeqian <zhukeqian1@huawei.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sat, Dec 17 2022, zhukeqian <zhukeqian1@huawei.com> wrote:

> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/145
>
> Hi all TC members:
> This is to request a vote on resolving the above issue.

I had hoped that someone familiar with this would review this
patch... I've noted a typo below.

Also, as the end-of-year holiday season is starting in most western
countries, it is better to defer any voting to January.

>
> Thanks,
> Keqian
>
>
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: virtio-comment@lists.oasis-open.org <virtio-=
comment@lists.oasis-open.org> =E4=BB=A3=E8=A1=A8 Keqian Zhu
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2022=E5=B9=B49=E6=9C=8813=E6=97=A5 =
14:54
> =E6=94=B6=E4=BB=B6=E4=BA=BA: virtio-comment@lists.oasis-open.org
> =E6=8A=84=E9=80=81: mst@redhat.com; Wanghaibin (D) <wanghaibin.wang@huawe=
i.com>; sundongxu (A) <sundongxu3@huawei.com>
> =E4=B8=BB=E9=A2=98: [virtio-comment][PATCH v2] pci: Update ISR related de=
scription about MSI-X
>
> In commit 6a83c1d41748 ("pci: set ISR bit on config change with MSI-X"), =
device is required to set ISR bit on config change even when MSI-X enabled.
>
> This update other ISR related description for above commit.
>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  content.tex | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index e863709..01a4bfe 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -1158,10 +1158,10 @@ \subsubsection{ISR status capability}\label{sec:V=
irtio Transport Options / Virti  \end{tabular}
> =20
>  To avoid an extra access, simply reading this register resets it to 0 an=
d -causes the device to de-assert the interrupt.
> +causes the device to de-assert the interrupt when using INT\#x interrupt=
.
> =20
>  In this way, driver read of ISR status causes the device to de-assert -a=
n interrupt.
> +an INT\#x interrupt.
> =20
>  See sections \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / P=
CI-specific Initialization And Device Operation / Used Buffer Notifications=
} and \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specifi=
c Initialization And Device Operation / Notification of Device Configuratio=
n Changes} for how this is used.
> =20
> @@ -1511,7 +1511,7 @@ \subsubsection{Device Initialization}\label{sec:Vir=
tio Transport Options / Virti
> =20
>  When MSI-X capability is present and enabled in the device  (through sta=
ndard PCI configuration space) \field{config_msix_vector} and \field{queue_=
msix_vector} are used to map configuration change and queue -interrupts to =
MSI-X vectors. In this case, the ISR Status is unused.
> +interrupts to MSI-X vectors.
> =20
>  Writing a valid MSI-X Table entry number, 0 to 0x7FF, to  \field{config_=
msix_vector}/\field{queue_msix_vector} maps interrupts triggered @@ -1681,6=
 +1681,7 @@ \subsubsection{Notification of Device Configuration Changes}\la=
bel{sec:Virtio Tr
> =20
>    \item If MSI-X capability is enabled:
>      \begin{enumerate}
> +    \item Set the second lower bit of the ISR Status field for the devic=
e.
>      \item If \field{config_msix_vector} is not NO_VECTOR,
>        request the appropriate MSI-X interrupt message for the
>        device, \field{config_msix_vector} sets the MSI-X Table entry @@ -=
1718,13 +1719,15 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Vi=
rtio Transport Options /
>      \end{itemize}
>    \item If MSI-X capability is enabled:
>      \begin{itemize}
> +      \item Read the ISR Status field, which will reset it to zero.
>        \item
>          Look through all virtqueues mapped to that MSI-X vector for the
>          device, to see if any progress has been made by the device
>          which requires servicing.
>        \item
> -        If the MSI-X vector is equal to \field{config_msix_vector},
> -        re-examine the configuration space to see what changed.
> +        If the second lower bit of ISR Status filed is set and the

"of the ISR Status field", I guess?

> +        MSI-X vector is equal to \field{config_msix_vector}, re-examine
> +        the configuration space to see what changed.
>      \end{itemize}
>  \end{itemize}


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

