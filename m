Return-Path: <virtio-comment-return-8857-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560E9C41535
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 08:26:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 844C526A45
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 08:26:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 677B0986603
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 08:26:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5660C98427C; Fri, 22 Dec 2023 08:26:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 476909865C1
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Dec 2023 08:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: lHlUdSdfMVW2YpcXYAnW-Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703233584; x=1703838384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EHjBNu7CW/gq0Xsdm6UIvrplnHeHn5GZ7bM9BIWgjlA=;
        b=sy8bSsNfMHDuO73xyjpfI86CgDWpLqCHBJk4vhSBhz2K+AhgYt/hdcLE0MIXnmsKTe
         ZV+hrZPDxFTxc5Cc/RodXRU85GQ8pzHEBqj6uN0IVbMGeXLyMSGKGGo9JneejWgDRiDk
         okZ9MPwdK/tqKSf46y4gQQgU/iees2gAxtOnpuO1tnkqv7XwnKCkMNKi9TAOcyG4ZiX3
         gyzst7qjbW3mL7DZ4J0PPdbGg3Yk6ZvTE2tlihrgZnuRqO4e7ZRTdrSgzsfPJ2vSVMoC
         S1/bLEUGI6cUi0FE0K6dxDlfqhSZiM89f5gh/b3y3C/T5n7h8fO+mv+eIwh8sFTDwY2g
         Zu3Q==
X-Gm-Message-State: AOJu0YxhlBAYDJPYsIXPWzUXhY1AEgv2R1bOppcD1B3c77ysCW0NPkEj
	FiaLMWWtS1Spalo+FqS6+UoSYu13SQFP+V4AuuufBfWU1K9Hxt3GGr8RziObd1xQYM5nQmff3ZR
	OMG4hsQOY1oeDGCNyT0XDmjSJneJ8MY9hlx8vmF/loA==
X-Received: by 2002:a05:600c:1d14:b0:40b:32e7:2ffa with SMTP id l20-20020a05600c1d1400b0040b32e72ffamr590534wms.20.1703233583835;
        Fri, 22 Dec 2023 00:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEu2gE33La5WnHuWag0w1yHceOf9p3a+xVgaDVVZASn7pCD5Q7UfN0SZVwEWAT5AeLlt+0ltA==
X-Received: by 2002:a05:600c:1d14:b0:40b:32e7:2ffa with SMTP id l20-20020a05600c1d1400b0040b32e72ffamr590525wms.20.1703233583508;
        Fri, 22 Dec 2023 00:26:23 -0800 (PST)
Date: Fri, 22 Dec 2023 03:26:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20231222032455-mutt-send-email-mst@kernel.org>
References: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
 <CACGkMEt_kvBbnpNt_cfB8KdKWM9WP8T_wnQBm13yKpe5JYVnAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEt_kvBbnpNt_cfB8KdKWM9WP8T_wnQBm13yKpe5JYVnAg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH RESEND] virtio-net: support setting coalescing params for
 multiple vqs

On Thu, Dec 21, 2023 at 11:37:17AM +0800, Jason Wang wrote:
> On Wed, Dec 20, 2023 at 10:40 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> >
> > Currently, when each time the driver attempts to update the coalescing parameters
> > for a vq, it needs to kick the device and wait for the ctrlq response to return.
> >
> > If a command can only update one vq parameters, when the parameters are updated
> > frequently (such as netdim), ctrlq on the device is kicked frequently, which will
> > increase the device CPU scheduling overhead, and the number and overhead of device
> > DMA will also increase.
> >
> > Merging multiple vq updated parameters into one command can effectively reduce
> > the number of kick devices and device DMA times.
> >
> > Test results show that this greatly improves the efficiency of the ctrlq in
> > responding to multiple vq coalescing parameter updates issued by the driver.
> 
> So netdim is per virtqueue, to make use of this, you need to batch the
> netdim requests first. And if you do that, you can batch the commands
> as well. Then you get one kick for sevreal coal requests?
> 
> Or are you saying you run out of ctrl vq?
> 
> Thanks

I think Heng is saying ctrl vq implementation on this DPU is so bad,
you need to avoid that as much as possible.

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

