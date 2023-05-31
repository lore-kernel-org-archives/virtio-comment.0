Return-Path: <virtio-comment-return-6044-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EB2C77B7C
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 06:08:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 226293309A
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 06:08:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1010298659F
	for <virtio-comment@archiver.kernel.org>; Wed, 31 May 2023 06:08:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 03C9198658F; Wed, 31 May 2023 06:08:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E28BF986596
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 May 2023 06:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: cLjVVQ3CNjOYH08v6-eDXQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685513282; x=1688105282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaG7LQahZkIDm9HIuYbz4+rDravtHiJEIkbM9c8zQCc=;
        b=lMaJ3rwsRm2g2Ig1Lfq3RnA1EtUm1kHA/n0PxWboauVRBx03rmeFtHoSVgElZ/2ema
         o13WqPVHO/QHodpTneJSQRmapTHj0/j7wN9/wzCyr+apCR+NVThjiewA/LTthzK261SP
         rH2/fk3mK6X418046JTyFxq3b9hYsvXmtSGgFgNN3HbNX6KVqUIwW47+exFE+wqwQMAQ
         64G4+vDdFGYFElEVO7Dw7cA5Kc2L84eZIJFEGILlrTz4PUU2SPsb+KNIM1OmZVwyNV2W
         GeLAgnDTHZgmEHesD4xubwByQ0rZ4VG1+efwx0uaYqYwDq2FN7HczVs3pF/23jRCBzme
         rlkQ==
X-Gm-Message-State: AC+VfDx7ZqBA+MCxMK1gSWDwmHg1npNACbyDvq+wulliA/jQ1QrsScyz
	flXq01D/sgVCXo8R93UT9CqUEVA0pae1yK338zHnadSuiIMvmowiZsdvVOxWMC0gQI9kUI/+mBK
	UEJeAiVkxCejbUsbwvUt5RbfaJbNhoYrE4w==
X-Received: by 2002:a2e:a28f:0:b0:2ad:9acb:4849 with SMTP id k15-20020a2ea28f000000b002ad9acb4849mr1847521lja.47.1685513282672;
        Tue, 30 May 2023 23:08:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7zAaBP1alQm8o1vxt5moZjFQUwyz9uCjA3MwyYzoKv5akxCkm5Xta5jAquutD2YBAeKftu0w==
X-Received: by 2002:a2e:a28f:0:b0:2ad:9acb:4849 with SMTP id k15-20020a2ea28f000000b002ad9acb4849mr1847495lja.47.1685513282309;
        Tue, 30 May 2023 23:08:02 -0700 (PDT)
Date: Wed, 31 May 2023 02:07:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexandre Courbot <acourbot@google.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	Albert Esteve <aesteve@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Andrew Gazizov <andrew.gazizov@opensynergy.com>,
	Andrii Cherniavskyi <andrii.cherniavskyi@opensynergy.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Enric Balletbo i Serra <eballetb@redhat.com>,
	Enrico Granata <egranata@google.com>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Keiichi Watanabe <keiichiw@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Gordeev <alexander.gordeev@opensynergy.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Matti =?iso-8859-1?Q?M=F6ll?= <Matti.Moell@opensynergy.com>
Message-ID: <20230531020611-mutt-send-email-mst@kernel.org>
References: <CAPBb6MXBaKKFGg8Yt2Me8kjUwCm4utWcsVOiCS1Qunjhza4Ycg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPBb6MXBaKKFGg8Yt2Me8kjUwCm4utWcsVOiCS1Qunjhza4Ycg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: virtio-v4l2 specification draft

On Wed, May 31, 2023 at 03:02:04PM +0900, Alexandre Courbot wrote:
> Hello everyone,
> 
> With the virtio-video call taking place soon, I thought it would help
> everyone understand both proposals if I sent a more formal
> specification of what virtio-v4l2 looks like. Please find it attached
> to this email.
> 
> I apologize for not finishing and sending this earlier, but hopefully
> at 7 and a half pages it should be rather quick to skim through. :)
> 
> Despite its short size, this spec is capable of supporting camera and
> image processor devices (on top of decoder/encoders), and also allows
> for another kind of memory backing for buffers (host-managed) that is
> not supported by virtio-video.
> 
> For convenience I have made use of clickable links to the relevant
> parts of the V4L2 documentation, since it is supposed to be used
> alongside this spec.
> 
> Looking forward to a fruitful discussion tomorrow!
> 
> Cheers,
> Alex.


Can you please post patch with tex source inline as opposed as
pdf as an attachment? Thanks!

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

