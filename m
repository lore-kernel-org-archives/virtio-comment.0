Return-Path: <virtio-comment-return-7471-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512EACD54AB
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 09:44:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 95E632B04E
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 09:44:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86B5598651C
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 09:44:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 75DB6983E25; Tue, 19 Sep 2023 09:44:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 650299864C2
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Sep 2023 09:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fie2ft3xMwWVJ6fUgnP8xQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695116640; x=1695721440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vu8tgJc7XtYqldRwQrzM8br46Jv8/+7i7MeVb5Gsy6I=;
        b=KD0zbb4+GQhYrxdbERzuvLEv5sOmmRmFgE5SPHng4McWiiAHOgxwbQLDgV8ClueChM
         EMAGQrX3ZI8Wj6EeKf9EJmAqa3JON2CcO8HyVaogJmN2gj6XBYrHtO7JL5odeXuTfZKW
         MekM5y703pMk+LGj9BePPgnaFh3UkSWuhgxF/RDGQmVb4IjQXatw9uMOzKPDI5iXKedz
         d26+x/CHrkO6iaRGaHaVguDGKnmi4n00hw5AB1bx37ednDY2GKsIWh0euHPxl7r4ZRiN
         61ci3YYm2ENqwSLnaaMhi8wlFAr3Wsf7irG4qXK1gc4JvgRjmeAmG5tiI7q/iMiGOv1q
         zasA==
X-Gm-Message-State: AOJu0YzO8cAuwI/ds3AxfXdNLqVEL3+vRIq7zaXJRolHqUEv7jPhWHXq
	XnP57QGvpNlPpAkPGmdcdHPNwFcDX/ObKCrL6ElleBVzwxsO7T+pWNU0otqHVMeb2mXgJZ6Q+Er
	pNqqXJX8bL2OSsr3EtcDEEksAKjuEYcJCUQ==
X-Received: by 2002:a05:651c:120f:b0:2b6:e958:5700 with SMTP id i15-20020a05651c120f00b002b6e9585700mr9841511lja.4.1695116640774;
        Tue, 19 Sep 2023 02:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECDIbtWtvCO2ftih+O6eK9cTVxACQ5N6zMyqyehUAPmujMz2cmjb73vi4qTijKlbF52Hqz4Q==
X-Received: by 2002:a05:651c:120f:b0:2b6:e958:5700 with SMTP id i15-20020a05651c120f00b002b6e9585700mr9841496lja.4.1695116640436;
        Tue, 19 Sep 2023 02:44:00 -0700 (PDT)
Date: Tue, 19 Sep 2023 05:43:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtualization@lists.linux-foundation.org,
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com,
	stefanha@redhat.com, jasowang@redhat.com
Message-ID: <20230919054054-mutt-send-email-mst@kernel.org>
References: <ZQHPeD0fds9sYzHO@pc-79.home>
MIME-Version: 1.0
In-Reply-To: <ZQHPeD0fds9sYzHO@pc-79.home>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: virtio-sound linux driver conformance to spec

On Wed, Sep 13, 2023 at 05:04:24PM +0200, Matias Ezequiel Vara Larsen wrote:
> Hello,
> 
> This email is to report a behavior of the Linux virtio-sound driver that
> looks like it is not conforming to the VirtIO specification. The kernel
> driver is moving buffers from the used ring to the available ring
> without knowing if the content has been updated from the user. If the
> device picks up buffers from the available ring just after it is
> notified, it happens that the content is old.

Then, what happens, exactly? Do things still work?

> This problem can be fixed
> by waiting a period of time after the device dequeues a buffer from the
> available ring. The driver should not be allowed to change the content
> of a buffer in the available ring. When buffers are enqueued in the
> available ring, the device can consume them immediately.
> 
> 1. Is the actual driver implementation following the spec?  
> 2. Shall the spec be extended to support such a use-case?
> 
> Thanks, Matias


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

