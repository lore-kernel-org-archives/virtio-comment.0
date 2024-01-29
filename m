Return-Path: <virtio-comment-return-9024-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8698FC47DDB
	for <virtio-comment@archiver.kernel.org>; Mon, 29 Jan 2024 16:26:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0F2BE2AED1
	for <virtio-comment@archiver.kernel.org>; Mon, 29 Jan 2024 16:26:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02183986875
	for <virtio-comment@archiver.kernel.org>; Mon, 29 Jan 2024 16:26:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EA861983F75; Mon, 29 Jan 2024 16:26:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD470986871
	for <virtio-comment@lists.oasis-open.org>; Mon, 29 Jan 2024 16:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: z-Iz12aUPi2GpOzS2b3sTA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706545602; x=1707150402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxUDcWpW4ouWaawTqPmXLnTmALFmE/4uvtl3SCvxtkI=;
        b=GQ4E942s7aJVXG187ppAGMZ8FJF6msCTm8V0avyJs0laMfTfseIgEiAKOP1xedmf7m
         X783zSrZ89fYgNF27R/N614J6n0wEUotG5gqay0O1NSGQRLDwZek9DbfxYutFqjvBpVA
         zIbNXGL+W24+3zwH3dgvDMSasREGDCrpxD8WXX0HZEo6d3Qdyj4czQfRqgNIlQMKBUDG
         6tPjQc3etrtdlDt6bKYrLtMz1TfznEHkS0ai3Bl4ELnA6eNJOREYJkGFZ8NPiPma8A+P
         W2veEWsadi3z0meRHsSvGlGs6NrbfprafwqdlOswFLTdgdqSK8AyIQBIfxe+zjeq9Yjk
         6eyw==
X-Gm-Message-State: AOJu0YwW/TYhAg0MGv5sze2NRl06G+m+k92QXxSrmTHdUXSA0yynuh48
	kAlO/iKt15fg1XsOiZECxnhe/Zq/20SPWOyMz27ww8t21UqTwkOaM18XDvBf4hkJvQVqW8Yl58t
	xL+eD2zYggkIsz+RDn8SFqiprvZ0hSv8Z1HWJ6fVL8rg2M3ZNTK3dmGaRgXZh+zS+v0eNH2I+ap
	oXoR0=
X-Received: by 2002:a5d:654b:0:b0:33a:ee2f:71a2 with SMTP id z11-20020a5d654b000000b0033aee2f71a2mr2107892wrv.44.1706545602152;
        Mon, 29 Jan 2024 08:26:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8uSRon7AxE8IMwI/ySqP8bhscYC3UqskpVAuPexpE40DwysFPJKAtTiRbZhd9a19Nvh1DSw==
X-Received: by 2002:a5d:654b:0:b0:33a:ee2f:71a2 with SMTP id z11-20020a5d654b000000b0033aee2f71a2mr2107879wrv.44.1706545601827;
        Mon, 29 Jan 2024 08:26:41 -0800 (PST)
Date: Mon, 29 Jan 2024 11:26:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	virtio@lists.oasis-open.org
Message-ID: <20240129112559-mutt-send-email-mst@kernel.org>
References: <ff9a6d805e7d510cde77b9989bef90aa21ffe4b4.1706094950.git.mst@redhat.com>
 <87a5ookwme.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87a5ookwme.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio] [PATCH] virtio-net: clarify error handling for
 coalescing

On Mon, Jan 29, 2024 at 04:06:01PM +0100, Cornelia Huck wrote:
> On Wed, Jan 24 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > This is not a huge deal since it's a SHOULD anyway,
> > so make the new requirement SHOULD too.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  device-types/net/description.tex | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > index aff5e08..d1d25fe 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -1792,7 +1792,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> >  
> >  The device MUST ignore \field{reserved}.
> >  
> > -The device SHOULD respond to VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and VIRTIO_NET_CTRL_NOTF_COAL_RX_SET commands with VIRTIO_NET_ERR if it was not able to change the parameters.
> > +The device SHOULD respond to VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and
> > +VIRTIO_NET_CTRL_NOTF_COAL_RX_SET commands with VIRTIO_NET_ERR if
> > +it was not able to change coalescing parameters. In this case,
> 
> Hm, if we explicitly specify "coalescing parameters" here, should we add
> it below as well? (We probably should keep the "the".)

maybe "some of the" and in the next sentence "all of the".

so it's atomic: all or nothing.

> > +the parameters SHOULD remain unchanged, for all VQs.
> > +
> >  
> >  The device MUST respond to the VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET command with VIRTIO_NET_ERR if it was not able to change the parameters.


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

