Return-Path: <virtio-comment-return-4903-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF8AC61DA4
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Mar 2023 16:26:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D115676072
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Mar 2023 16:26:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5FD2198643E
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Mar 2023 16:26:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 52137986414; Wed, 15 Mar 2023 16:26:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F3E2986508
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Mar 2023 16:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: xFGRVeZ2Osm7_4fVhHaeLw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678897581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yl/AUBXeUXQMYfD+tfLHxjEm0F4Sk1NMcG7Pol4YGNI=;
        b=ny0XRYI28aSbnko1DM0LeEjYlhFmFG4l2SI+qHl6T7tujwK4XhmAhVJfOP9xUiB9Sv
         DM7Vjuzgrzq631IZ+i37H1qdpW+AfW8vJGD2R998zgOSQDABzsHCtt12sVQa6JuBdi/c
         dfSb0VxjAma2cxEAIQZ8VpUDrkpdl/uefAiIqf8ptqNko0OKt3jZo0Yyc0fdBiuVaD19
         9ZEv1tsw3HBvrq3IjxTPCTdmWaJiV9RBwbBM7p4jjs62JULgmY7XkRno60Bpgwx9wIXb
         OnfF6YTq6aG/XEGA3Pi1sNOxbi0OrHobiJufrGMReCIELtHRME5LtvpAy4mSSItJ9jO9
         2qFA==
X-Gm-Message-State: AO0yUKU0IDrWfhDN3PBGWRkYBYadGNd9OPia+bdKnx2IL5vUZWMmtRng
	vC0R65BH27CSpI7AY/ux3AKRnzAUwUGlDFO+6cL3S6QLWiKFMsWyuMVGKYyGgqpPyHsKE/+2ItS
	QeEeRoMc9lAJqe8cshbN+en8nmBegrYwYnA==
X-Received: by 2002:a05:600c:35d2:b0:3eb:1d0c:ad71 with SMTP id r18-20020a05600c35d200b003eb1d0cad71mr18724433wmq.23.1678897581439;
        Wed, 15 Mar 2023 09:26:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set+IXxS0mW653O/9tey+5sEGfTahdeqbtkeFrernhxw9G8qMYC2EMM8GtRGb8v9gPwa7+R+S0Q==
X-Received: by 2002:a05:600c:35d2:b0:3eb:1d0c:ad71 with SMTP id r18-20020a05600c35d200b003eb1d0cad71mr18724414wmq.23.1678897581125;
        Wed, 15 Mar 2023 09:26:21 -0700 (PDT)
Date: Wed, 15 Mar 2023 12:26:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Igor Skalkin <Igor.Skalkin@opensynergy.com>,
	virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org, luiz.dentz@gmail.com,
	marcel@holtmann.org, johan.hedberg@gmail.com, jasowang@redhat.com
Message-ID: <20230315122415-mutt-send-email-mst@kernel.org>
References: <20230310062613.109867-1-Igor.Skalkin@opensynergy.com>
 <20230310062613.109867-2-Igor.Skalkin@opensynergy.com>
 <87edpqt3e8.fsf@redhat.com>
 <20230315120359-mutt-send-email-mst@kernel.org>
 <87bkkut29y.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87bkkut29y.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 1/1] RFC: virtio-bt: add virtio BT
 device specification

On Wed, Mar 15, 2023 at 05:20:09PM +0100, Cornelia Huck wrote:
> On Wed, Mar 15 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Mar 15, 2023 at 04:55:59PM +0100, Cornelia Huck wrote:
> >> On Fri, Mar 10 2023, Igor Skalkin <Igor.Skalkin@opensynergy.com> wrote:
> >> > +\subsection{Feature bits}\label{sec:Device Types / BT Device / Feature bits}
> >> > +
> >> > +\begin{description}
> >> > +\item[VIRTIO_BT_F_VND_HCI (0)]  Indicates vendor command support.
> >> > +\item[VIRTIO_BT_F_MSFT_EXT (1)] Indicates MSFT vendor support.
> >> > +\item[VIRTIO_BT_F_AOSP_EXT (2)] Indicates AOSP vendor support.
> >> > +\item[VIRTIO_BT_F_CONFIG_V2 (3)] The device uses the second version of the
> >> > +configuration space structure.
> >> > +\end{description}
> >> > +
> >> > +\devicenormative{\subsubsection}{Feature bits}{Device Types / BT Device / Feature bits}
> >> > +
> >> > +The device MUST require the driver to accept the VIRTIO_BT_F_CONFIG_V2 feature
> >> > +bit, i.e. not set FEATURES_OK without it, and use the second version
> >> > +(struct virtio_bt_config_v2) of the configuration layout, because the
> >> > +first one (struct virtio_bt_config) is unaligned, which violates the
> >> > +specification.
> >> 
> >> Did we have a device or driver that didn't use v2? I'm not sure we want
> >> to add a feature for that, other than for backwards compatibility.
> >
> > Linux drivers use a different layout, yes.
> 
> Oh, indeed.
> 
> >
> > I think it should be possible to implement device without
> > VIRTIO_BT_F_CONFIG_V2 if someone wants to be compatible.
> 
> So, do we need to downgrade the requirements for this feature to SHOULD?
> 
> >
> > And hmm we need to get back to addressing the negotiation mess ...

For devices I would downgrade it to MAY even.

-- 
MST


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

