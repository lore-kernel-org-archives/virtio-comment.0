Return-Path: <virtio-comment-return-2466-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F40B1986180
	for <virtio-comment@lists.oasis-open.org>; Sun, 26 Dec 2021 08:18:47 +0000 (UTC)
Date: Sun, 26 Dec 2021 03:18:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20211226031821-mutt-send-email-mst@kernel.org>
References: <20211209140543.1876-1-longpeng2@huawei.com>
 <d09a2b0c1cee4d2180b33c452a42794c@huawei.com>
MIME-Version: 1.0
In-Reply-To: <d09a2b0c1cee4d2180b33c452a42794c@huawei.com>
Subject: [virtio-comment] Re: [PATCH] content: reserve virtio device ID for QingTian Box
 devices
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Dec 23, 2021 at 02:49:25PM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> Hi Michael,
> 
> Is there anything else I need to do to reserve the device id?

Follow these steps please:

https://github.com/oasis-tcs/virtio-spec#use-of-github-issues

> > -----Original Message-----
> > From: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > Sent: Thursday, December 9, 2021 10:06 PM
> > To: virtio-comment@lists.oasis-open.org
> > Cc: Gonglei (Arei) <arei.gonglei@huawei.com>; Longpeng (Mike, Cloud
> > Infrastructure Service Product Dept.) <longpeng2@huawei.com>
> > Subject: [PATCH] content: reserve virtio device ID for QingTian Box devices
> > 
> > From: Longpeng <longpeng2@huawei.com>
> > 
> > Huawei Cloud is one of the famous public cloud providers, and its
> > hypervisor is named QingTian. We plan to support the QingTian Box
> > that provides some guest-aware features ( for high performance,
> > security, etc. ) in the future, and at least one of them is already
> > in development. It needs data transmission based on the Virtio, so
> > we want to reserve a device id ( 43 ) for the QingTian Box.
> > 
> > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > ---
> >  content.tex | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/content.tex b/content.tex
> > index 899df5f..2a6f9de 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2893,6 +2893,8 @@ \chapter{Device Types}\label{sec:Device Types}
> >  \hline
> >  42         &   RDMA device \\
> >  \hline
> > +43         &   QingtianBox \\
> > +\hline
> >  \end{tabular}
> > 
> >  Some of the devices above are unspecified by this document,
> > --
> > 1.8.3.1


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

