Return-Path: <virtio-comment-return-2364-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1938F9864DA
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 Nov 2021 17:38:02 +0000 (UTC)
Date: Thu, 18 Nov 2021 18:37:52 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20211118183752.32100dc3.pasic@linux.ibm.com>
In-Reply-To: <20211110185555.190-2-tstark@linux.microsoft.com>
References: <20211110185555.190-1-tstark@linux.microsoft.com>
	<20211110185555.190-2-tstark@linux.microsoft.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v5 1/1] virtio-pmem: Support describing
 pmem as shared memory region
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: tstark@linux.microsoft.com
Cc: virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com, pankaj.gupta.linux@gmail.com, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 10 Nov 2021 10:55:55 -0800
tstark@linux.microsoft.com wrote:
[..]
> @@ -36,22 +39,45 @@ \subsection{Device configuration layout}\label{sec:De=
vice Types / PMEM Device /
>  \end{lstlisting}
> =20
>  \begin{description}
> -\item[\field{start}] contains the physical address of the first byte of =
the persistent memory region.
> +\item[\field{start}] contains the physical address of the first byte of =
the
> +persistent memory region, if VIRTIO_PMEM_F_SHMEM_REGION has not been neg=
otiated.
> =20
> -\item[\field{size}] contains the length of this address range.
> +\item[\field{size}] contains the length of this address range, if
> +VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated.
>  \end{description}
> =20
> +\subsection{Device Initialization}\label{sec:Device Types / PMEM Device =
/ Device Initialization}
> +
> +The device indicates the guest physical address to the driver in one of =
two ways:
>  \begin{enumerate}
> -\item Driver vpmem start is read from \field{start}.
> -\item Driver vpmem end is read from \field{size}.
> +\item As a guest absolute address, using virtio_pmem_config.
> +\item As a shared memory region.
>  \end{enumerate}
> =20
> -\subsection{Driver Initialization}\label{sec:Device Types / PMEM Driver =
/ Driver Initialization}
> -
>  The driver determines the start address and size of the persistent memor=
y region in preparation for reading or writing data.
> =20
>  The driver initializes req_vq in preparation for making flush requests.
> =20
> +\devicenormative{\subsubsection}{Device Initialization}{Device Types / P=
MEM Device / Device Initialization}
> +
> +If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the device MUST indic=
ate the
> +guest physical address as a shared memory region. The device MUST use sh=
ared
> +memory region ID 0. The device SHOULD set \field{start} and \field{size}=
 to zero.
> +
> +
> +If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the device MUST i=
ndicate
> +the guest physical address as a guest absolute address. The device MUST =
set
> +\field{start} to the absolute address and \field{size} to the size of th=
e
> +address range, in bytes.

Sorry for joining in this late.=20

I'm wondering if the quoted parts implies that the device SHOULD change
its config space (fields start and size) when the driver sets
FEATURES_OK, and the feature is VIRTIO_PMEM_F_SHMEM_REGION set at the
device (it was offered, and got set).

My train of thought is: initially no feature is considered negotiated,
and config space access is allowed before feature negotiation is
completed. That means the at this stage the device must indicate via
the config space, and thus \field{size} !=3D 0. But as a part of the
transition 'features not negotiated' -> 'features negotiated' the device
needs to go '\field{size} !=3D 0' -> '\field{size} =3D=3D 0'

Is that what we want?

Also I understand that Hyper-V would make the device cease operation if
the feature VIRTIO_PMEM_F_SHMEM_REGION was not accepted by the driver.
I believe I've read that in some previous email.

Do we need a  'MAY fail to operate further if' statement? Anything that
ain't guarded by feature bits ain't optional, and anything that is
guarded by feature bits is optional unless explicitly stated otherwise.

Regards,
Halil

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

