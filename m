Return-Path: virtio-comment-return-1267-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F8DE985F47
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 May 2020 06:57:53 +0000 (UTC)
Date: Tue, 19 May 2020 08:57:44 +0200
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20200519085744.17bd65f6.cohuck@redhat.com>
In-Reply-To: <20200515132751.62332-2-david@redhat.com>
References: <20200515132751.62332-1-david@redhat.com>
	<20200515132751.62332-2-david@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH 1/3] conformance: make driver
 conformance list easier to read and maintain
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 15 May 2020 15:27:49 +0200
David Hildenbrand <david@redhat.com> wrote:

> Let's define it just like the device conformance list.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  conformance.tex | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/conformance.tex b/conformance.tex
> index b6fdec0..ed7d77f 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -15,7 +15,17 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>    \begin{itemize}
>      \item Clause \ref{sec:Conformance / Driver Conformance}.
>      \item One of clauses \ref{sec:Conformance / Driver Conformance / PCI Driver Conformance}, \ref{sec:Conformance / Driver Conformance / MMIO Driver Conformance} or \ref{sec:Conformance / Driver Conformance / Channel I/O Driver Conformance}.
> -    \item One of clauses \ref{sec:Conformance / Driver Conformance / Network Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Block Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Console Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Entropy Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Traditional Memory Balloon Driver Conformance}, \ref{sec:Conformance / Driver Conformance / SCSI Host Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Input Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Crypto Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Socket Driver Conformance} or \ref{sec:Conformance / Driver Conformance / IOMMU Driver Conformance}.
> +    \item One of clauses
> +\ref{sec:Conformance / Driver Conformance / Network Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / Block Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / Console Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / Entropy Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / Traditional Memory Balloon Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / SCSI Host Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / Input Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / Crypto Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / Socket Driver Conformance} or
> +\ref{sec:Conformance / Driver Conformance / IOMMU Driver Conformance}.
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>    \end{itemize}
>  \item[Device] A device MUST conform to four conformance clauses:

Looks much nicer.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


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

