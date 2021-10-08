Return-Path: <virtio-return-3599-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio@lists.oasis-open.org>
List-Post: <mailto:virtio@lists.oasis-open.org>
List-Help: <mailto:virtio-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-subscribe@lists.oasis-open.org>
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20211007111306.239420-1-cohuck@redhat.com>
References: <20211007111306.239420-1-cohuck@redhat.com>
Date: Fri, 08 Oct 2021 09:56:26 +0200
Message-ID: <87tuhsx845.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio] Re: [PATCH] PCI: fix level for vendor data capability
Content-Type: text/plain
To: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Oct 07 2021, Cornelia Huck <cohuck@redhat.com> wrote:

> The normative statements for the vendor data capability need
> to be at paragraph level insted of subsection level.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> I plan to push this as an editorial update.

Now pushed.

> ---
>  content.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index 39fe12b8ae40..5e716721edb3 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -1189,7 +1189,7 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
>  To make it safe for a generic driver to access the capability,
>  reads from this capability MUST NOT have any side effects.
>  
> -\devicenormative{\subsection}{Vendor data capability}{Virtio
> +\devicenormative{\paragraph}{Vendor data capability}{Virtio
>  Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>  Vendor data capability}
>  
> @@ -1206,7 +1206,7 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
>  Reads of the Vendor data capability by the driver MUST NOT have any
>  side effects.
>  
> -\drivernormative{\subsection}{Vendor data capability}{Virtio
> +\drivernormative{\paragraph}{Vendor data capability}{Virtio
>  Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>  Vendor data capability}
>  


---------------------------------------------------------------------
To unsubscribe from this mail list, you must leave the OASIS TC that 
generates this mail.  Follow this link to all your TCs in OASIS at:
https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php 

