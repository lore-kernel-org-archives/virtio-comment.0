Return-Path: <virtio-comment-return-3446-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20FEF986580
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Sep 2022 21:16:40 +0000 (UTC)
Date: Thu, 8 Sep 2022 17:16:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20220908171550-mutt-send-email-mst@kernel.org>
References: <20220902093548.52248-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220902093548.52248-1-zhukeqian1@huawei.com>
Subject: Re: [virtio-comment] [PATCH] pci: Update ISR related description
 about MSI-X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Keqian Zhu <zhukeqian1@huawei.com>
Cc: virtio-comment@lists.oasis-open.org, wanghaibin.wang@huawei.com, sundongxu3@huawei.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Sep 02, 2022 at 05:35:48PM +0800, Keqian Zhu wrote:
> In commit 6a83c1d41748 ("pci: set ISR bit on config change with MSI-X"),
> device is required to set ISR bit on config change even when MSI-X enabled.
> 
> This update other ISR related description for above commit.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  content.tex | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index e863709..fea576d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -1158,10 +1158,10 @@ \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virti
>  \end{tabular}
>  
>  To avoid an extra access, simply reading this register resets it to 0 and
> -causes the device to de-assert the interrupt.
> +causes the device to de-assert the interrupt when using INT\#x interrupt.
>  
>  In this way, driver read of ISR status causes the device to de-assert
> -an interrupt.
> +an INT\#x interrupt.
>  
>  See sections \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Used Buffer Notifications} and \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Notification of Device Configuration Changes} for how this is used.
>  
> @@ -1511,7 +1511,7 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
>  
>  When MSI-X capability is present and enabled in the device
>  (through standard PCI configuration space) \field{config_msix_vector} and \field{queue_msix_vector} are used to map configuration change and queue
> -interrupts to MSI-X vectors. In this case, the ISR Status is unused.
> +interrupts to MSI-X vectors.
>  
>  Writing a valid MSI-X Table entry number, 0 to 0x7FF, to
>  \field{config_msix_vector}/\field{queue_msix_vector} maps interrupts triggered
> @@ -1681,6 +1681,8 @@ \subsubsection{Notification of Device Configuration Changes}\label{sec:Virtio Tr
>  
>    \item If MSI-X capability is enabled:
>      \begin{enumerate}
> +    \item If \field{config_msix_vector} is not NO_VECTOR, set the second
> +      lower bit of the ISR Status field for the device.

I think it has to be set always. With NO_VECTOR driver
can poll for config changes.

>      \item If \field{config_msix_vector} is not NO_VECTOR,
>        request the appropriate MSI-X interrupt message for the
>        device, \field{config_msix_vector} sets the MSI-X Table entry
> @@ -1718,13 +1720,15 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Virtio Transport Options /
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
> +        MSI-X vector is equal to \field{config_msix_vector}, re-examine
> +        the configuration space to see what changed.
>      \end{itemize}
>  \end{itemize}
>  
> -- 
> 2.33.0
> 
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

