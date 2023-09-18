Return-Path: <virtio-comment-return-7450-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE0CC46CA1
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 12:50:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 04ED685048
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 12:50:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D615B9863D7
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 12:50:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C45769863A4; Mon, 18 Sep 2023 12:50:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E4BF9863A5
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Sep 2023 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: xDnGoVLKOUOaDE7lB5vxXA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695041414; x=1695646214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEQqSlWB5iN4GuzRRQx0AqTTb5cOZLoq5svJf8PzKVg=;
        b=C5+O633CwkAZES29nelBD3qRj3v68kl1loJ6qLiiPX2z/syabe6HDD0pe2PBEeTqKw
         qfpbf5jZ2ADVJKniohkPJGWFHkuDFZjlVCPNrMTiTt0UudYzySGx/pxPIvxL6ezmHlK4
         GdKh6MOKoqu2sioIGXEhkv06uh/BMPurfZwmP1kbkv1HgRF7QbFwBciIc2RMfkKkl2Ok
         /Fc+hSls6lAN9Nt4pWoU5Tdg2FiRpFL40HPAwfDQrMxqhlbYT/2rPa7yjpoKqqjHyD9v
         ZHlCHO3v/mkrRuqAbByRtdZtrDYhHeg2bRond60/ry10oqcpMz2ukZ4U6Ym4d0EQR/No
         5A6w==
X-Gm-Message-State: AOJu0YxTruGoYML5vO0Tne+lNc2l4D/tDt3l86Z3nkbM+FTNbS1swqKZ
	wMXiYhMYjyy6JA5YqS1zYpDyht8rI8an2wNSMW7jVgyABERtf8XfazaTQVAjuk+6+72j26ZyvW8
	neGyx8upozR2IQLT7GLd+YDKBUSwZdpvkiQ==
X-Received: by 2002:a05:620a:3882:b0:767:954:a752 with SMTP id qp2-20020a05620a388200b007670954a752mr7439369qkn.73.1695041413865;
        Mon, 18 Sep 2023 05:50:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9TKs7icWb1phO/bVGBoVdZHvcWFAxCSS0tqtIaZEIZZxjH/ojh4x/vq7/QDkT4CyOT2czvg==
X-Received: by 2002:a05:620a:3882:b0:767:954:a752 with SMTP id qp2-20020a05620a388200b007670954a752mr7439359qkn.73.1695041413664;
        Mon, 18 Sep 2023 05:50:13 -0700 (PDT)
Date: Mon, 18 Sep 2023 14:50:09 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	virtualization@lists.linux-foundation.org,
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com,
	stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com
Message-ID: <ZQhHgTxoUAnfYaiC@fedora>
References: <ZQHPeD0fds9sYzHO@pc-79.home>
 <CABgObfbXsHN6=ZmL0s+mtCypXs11LNECECO3Uud_J6PMr+JwNA@mail.gmail.com>
 <CAAjaMXbjRn27fpZHK982m4MyJGXWQTR99WHPAZQfcun+pe3GBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAjaMXbjRn27fpZHK982m4MyJGXWQTR99WHPAZQfcun+pe3GBw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] virtio-sound linux driver conformance to spec

On Wed, Sep 13, 2023 at 06:58:30PM +0300, Manos Pitsidianakis wrote:
> Hello Matias,
> 
> Please show and refer to code snippets from the kernel tree that you
> think are related to your question. It'd help us make sure we all talk
> about the same thing.
> 

In this discussion, I am referring to the way in which the virtio-sound
driver is manipulating buffers that have been consumed by the device,
e.g., used-ring in the tx queue. My understanding is the driver builds a
ring-buffer that is shared with the user application in the guest. As
soon as the device returns a buffer to the used ring, the driver puts
the request in the available ring again. This is my understanding from
sound/virtio/virtio_pcm_msg.c#L324. The user application updates the
content of the buffer at sound/virtio/virtio_pcm_msg.c#L322, but this
task is deferred by using schedule_work(). The update of the buffer may
happen once the buffers are already in the available ring.

Thanks, Matias.


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

