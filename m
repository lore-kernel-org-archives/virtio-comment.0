Return-Path: <virtio-comment-return-5540-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF84BC6FD18
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:09:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3649077BE7
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:09:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2CCB0986615
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Apr 2023 07:09:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 24849986416; Wed, 19 Apr 2023 07:09:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14EDC98641B
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Apr 2023 07:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1lRsRWy0PleUy95Nn_N-Pw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681888172; x=1684480172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOIbsmuvhe3d/4yLex8MPDoyARwHTcpB+Sq6KtfKcEo=;
        b=QVu7HqAipY1KIV0zw/bubQ/QL9dSWXul9QsL76HpJymzFOxnBPgbPOoVcTkLM1zmWG
         idrPTljBEGcJ6M0rCJwMOfUhGIcuolWaWkSmNiXI6b1+i+cKIlnosIvhUzdoLx+YWCVh
         n8tC0SAEErAOmBvLJPJuaenOxRjOppllek/udj9x6IM22ODTTfr88TF+nabO+lZcExuW
         bQCHx+xccPDF29uPmBRTQoDimfipc6S+knRkU+GQ26yQrP9NPQd02F0cyrPlmOdxIH7l
         0yuwNiZ7lmjZyF8CbIscYFmR7yS1A0hI0y21wWqdQG3sQo5bWbQlNNVB5JsEKiSUcwDM
         ezmg==
X-Gm-Message-State: AAQBX9cvgVbZ5mOuxonJ5pVh5EpFwfMI2HFtabwbmk4kXtWYuyu8DTQ6
	j1YAKolvNNlDVVjgelDRf1U6IbPYHMWzj0a/Ty+ztCQR9DMsOmFH871yo/D76fKGHScorq7k/la
	7zF+yMPByG+gRc2XjMn4zPLC9fG2sFwgKXw==
X-Received: by 2002:a7b:c404:0:b0:3f0:a785:f0e0 with SMTP id k4-20020a7bc404000000b003f0a785f0e0mr14578914wmi.40.1681888172543;
        Wed, 19 Apr 2023 00:09:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350bUWM7ZCx9Cjspkgu66kadmaVQGmEFpGfvxYv2rrR5s+cS3eQ1VTi8vD1Sp0Ay9JqbHZWZKAw==
X-Received: by 2002:a7b:c404:0:b0:3f0:a785:f0e0 with SMTP id k4-20020a7bc404000000b003f0a785f0e0mr14578904wmi.40.1681888172348;
        Wed, 19 Apr 2023 00:09:32 -0700 (PDT)
Date: Wed, 19 Apr 2023 03:09:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230419030906-mutt-send-email-mst@kernel.org>
References: <20230411194220.752355-1-parav@nvidia.com>
 <20230411194220.752355-2-parav@nvidia.com>
 <20230419030057-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230419030057-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 1/2] transport-pci: Improve config msix vector description

On Wed, Apr 19, 2023 at 03:05:11AM -0400, Michael S. Tsirkin wrote:
> On Tue, Apr 11, 2023 at 10:42:19PM +0300, Parav Pandit wrote:
> > config_msix_vector is the register that holds the MSI-X vector number
> > for receiving configuration change related interrupts.
> > 
> > It is not "for MSI-X".
> > 
> > Hence, replace the confusing text with appropriate one.
> > 
> > Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > 
> > ---
> > changelog:
> > v0->v1:
> > - added 'here'
> > - dropped 'receiving'
> > ---
> >  transport-pci.tex | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/transport-pci.tex b/transport-pci.tex
> > index 42be072..cb9fadd 100644
> > --- a/transport-pci.tex
> > +++ b/transport-pci.tex
> > @@ -343,7 +343,8 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> >          Driver Feature Bits selected by \field{driver_feature_select}.
> >  
> >  \item[\field{config_msix_vector}]
> > -        The driver sets the Configuration Vector for MSI-X.
> > +        The driver writes an MSI-X vector number here for Configuration change
> > +        interrupts.
> 
> Hmm I think it's "the vector", not an. And the order of words
> is unusual. We also don't normally use "writes here". Would
> 
> 	Used by the driver to set the MSI-X vector number for Configuration change interrupts.

or even Configuration change notification interrupts

this is what we call them elsewhere

> be equally acceptable?
> 
> 
> >  \item[\field{num_queues}]
> >          The device specifies the maximum number of virtqueues supported here.
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

