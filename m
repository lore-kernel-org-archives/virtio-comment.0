Return-Path: <virtio-comment-return-6808-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EABEB64DC
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 09:14:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 745792AEFC
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 09:14:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 52648986423
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 09:14:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 38242983FEA; Mon, 10 Jul 2023 09:14:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2304D98640D
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Jul 2023 09:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5UilZH4ONNu5SmHI81TvtA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688980473; x=1691572473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+nP+1sjWDLSVSV3FoWq2YnuLar/92gGFGqQVUKpNj8=;
        b=OyKGBVzC3i0N0wiA3bZUrMH/LA856PkUqzFWk4uirDjFUpNWJengDXSA7STi7cBVbt
         1LV+0vZl2BOXfoDP9TpOhMXt4P65TPeUfRrSYVG/qkrAeLJzFoJ1JaEBlr9iY4Beaq3a
         sST1vg9L1XSCdZzzqNbyWgjUhHrnvxjsM9rjnDQ4V+ZGM/C1WlAQjBjxnqFTUU1wehPM
         TfU3snwtWXgW9iWQ6kGwgjs/ACG11ynkeTt0/6L5m4j87v+l9k+ewOKVcZXvLOfTGi0+
         cgsaJbqsOdE43IIQ+pxrU1QiMCYcm+wwvLF9IaFgevnJjaPPaq9371+s3KwFUQX12NTn
         U+sg==
X-Gm-Message-State: ABy/qLai784BjLe7Kog507Pj5Hq2TfZAi91yeO4q5PrOnbmli76Le4N/
	P00RM8D/cAOMTsbRbQeLoCzC1Ejrdp94V0IyJLe2FaYJ8wPYZHsB1zMGNGvlhKjSWTUoyVw6NRn
	ip/Ycj9ZbGcuKQHgfzij+SAA6sQRkpx3YDA==
X-Received: by 2002:adf:ed43:0:b0:314:14be:1004 with SMTP id u3-20020adfed43000000b0031414be1004mr11385501wro.63.1688980472924;
        Mon, 10 Jul 2023 02:14:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEHlkFITrjGjKj6cqsv/g8m9K7+iRdtOzv0KGnG57ZkkG4zULLDsejeYQQ+LV89CUBlt2uyYw==
X-Received: by 2002:adf:ed43:0:b0:314:14be:1004 with SMTP id u3-20020adfed43000000b0031414be1004mr11385481wro.63.1688980472601;
        Mon, 10 Jul 2023 02:14:32 -0700 (PDT)
Date: Mon, 10 Jul 2023 05:14:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Haixu Cui <quic_haixcui@quicinc.com>, virtio-dev@lists.oasis-open.org,
	quic_ztu@quicinc.com, virtio-comment@lists.oasis-open.org,
	jrreinhart@google.com
Message-ID: <20230710051337-mutt-send-email-mst@kernel.org>
References: <20230417140353.870-1-quic_haixcui@quicinc.com>
 <20230417140353.870-2-quic_haixcui@quicinc.com>
 <20230630105606-mutt-send-email-mst@kernel.org>
 <40e540f0-b07e-63af-d639-bcd71e4b23a1@quicinc.com>
 <87sf9wywyg.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87sf9wywyg.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev][PATCH 1/2] virtio-spi: define the DEVICE ID for
 virtio SPI master

On Mon, Jul 10, 2023 at 10:47:35AM +0200, Cornelia Huck wrote:
> On Fri, Jul 07 2023, Haixu Cui <quic_haixcui@quicinc.com> wrote:
> 
> > Hi Michael S. Tsirkin, Cornelia Huck,
> >      I have created an issue 
> > https://github.com/oasis-tcs/virtio-spec/issues/174 to request Device ID 
> > 45 for SPI master. Please help to deal with it, thank you very much.
> 
> Technically, we're in feature freeze already, but practically, I don't
> think we should block adding a simple device id reservation... Michael,
> any objections to me creating a ballot later today?

I think it's fine. We can also put things on a next branch once we
freeze.

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

