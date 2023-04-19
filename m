Return-Path: <virtio-comment-return-5539-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DABC6FD18
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:09:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 56AE842A6F
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:09:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40142986432
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:09:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 37E9C98641F; Wed, 19 Apr 2023 07:09:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 27CB398641E
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Apr 2023 07:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: VqMYV6BiPuel6NtMxol7qQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681888140; x=1684480140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiSj/Y4eGfRgj/W9qU3/++JWC/iNvWA7Oj55ofNwirc=;
        b=k4FI/fef/GfH9zYdAe86MLjYZoloNUmFIdOgDFtb1xvIO3s7z3skhLUPi8xala7Cez
         7kfdTCfMeuYnypsNjCsI2fvRRoHJfjl5weFnG0LfQApGDiui2NilU1XMu1Ke/eXvuRq4
         IHs2LA8BPU5VwSG5xFSIzypXNqvseHReacfWVFNMWriK2Yh9lJNfrMrdjd5WeNK5lgmG
         xbCbfBlGvPUtEhB4u1SmDyZXprV3pSvVMNPYcPLZqcAvsUdLbQyS3Kddm7bfC+mz9IVg
         czwq8E4oPbe13kEf9Lk9C23UPaqC/yXWBJUBLXulLuP4tllTP9NDmGeGSkyj2NodAIbQ
         GWFw==
X-Gm-Message-State: AAQBX9d/jNbxcKRhtylpw5lm80ZwumZwNdXbAe3Yezg8FGaVOdI1jMW+
	dVak9bX0fDZ3oI24q9RdABtlWJ3bpaIT7HM9mhxEFSR1uTgyoYdjFILsUveweVYLUspPBolVt3k
	ITy2Pvpn4n3qSxpUXsJhh+woSHzAcPgoFKw==
X-Received: by 2002:adf:fc49:0:b0:2f8:d1e6:e721 with SMTP id e9-20020adffc49000000b002f8d1e6e721mr3742076wrs.51.1681888140546;
        Wed, 19 Apr 2023 00:09:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBkNgVFv/kdJd4Xec6hZHZOSDIWf2NwCF9565xDGOO5dGJxN3wvz9s4JJl9USFlTzeJWL65g==
X-Received: by 2002:adf:fc49:0:b0:2f8:d1e6:e721 with SMTP id e9-20020adffc49000000b002f8d1e6e721mr3742052wrs.51.1681888140217;
        Wed, 19 Apr 2023 00:09:00 -0700 (PDT)
Date: Wed, 19 Apr 2023 03:08:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230419030840-mutt-send-email-mst@kernel.org>
References: <20230411194220.752355-1-parav@nvidia.com>
 <20230411194220.752355-3-parav@nvidia.com>
 <20230419030514-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230419030514-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 2/2] transport-pci: Improve queue msix vector register
 desc

On Wed, Apr 19, 2023 at 03:08:30AM -0400, Michael S. Tsirkin wrote:
> On Tue, Apr 11, 2023 at 10:42:20PM +0300, Parav Pandit wrote:
> > queue_msix_vector register is for receiving interrupts from the device
> > for the virtqueue.
> > 
> > "for MSI-X" is confusing term.
> > 
> > Also it is the register that driver "writes" to, similar to
> > many other registers such as queue_desc, queue_driver etc.
> > 
> > Hence, replace the verb from use to write.
> > 
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > ---
> > changelog:
> > v0->v1:
> > - added 'here'
> > - dropped 'receiving'
> > ---
> >  transport-pci.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/transport-pci.tex b/transport-pci.tex
> > index cb9fadd..00669b5 100644
> > --- a/transport-pci.tex
> > +++ b/transport-pci.tex
> > @@ -367,7 +367,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> >          A 0 means the queue is unavailable.
> >  
> >  \item[\field{queue_msix_vector}]
> > -        The driver uses this to specify the queue vector for MSI-X.
> > +        The driver writes an MSI-X vector number here for virtqueue interrupts.
> 
> Here it's *the* specific queue not just some queue. And in fact
> we call them virtqueue notifications, not interrupts elsewhere.
> So how about:
> 
>         Used by the driver to set the MSI-X vector number for the virtqueue notifications.

or even "the virtqueue notification interrupts".

> 
> >  \item[\field{queue_enable}]
> >          The driver uses this to selectively prevent the device from executing requests from this virtqueue.
> > -- 
> > 2.26.2


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

