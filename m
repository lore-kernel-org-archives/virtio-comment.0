Return-Path: <virtio-comment-return-6161-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27EBC77B73
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:10:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 10B4E169CC6
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:10:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0EA998657E
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:10:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E5C199864BB; Tue,  6 Jun 2023 19:10:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0A529864C1
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 19:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0GqLTUdDNMGuG3HLOiNJ-w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078600; x=1688670600;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udPn0tcbDU9hWsTJCGPYgdacykg0LxOA1NxWJEjfMoo=;
        b=kXfIo67x18YpJ3yMPjEZ7qqQ5+Oa323GFhQB5SDkgl2dxDQGkj7pDI7VX9wo4PyLFU
         4vfDZoHppbI0fE3KihX7XNgrY90TzUIMKDEHzE4mQnYhK9ax6+Z1YqMR+ffeV9VnHDFp
         mRE2JAh9zLlWWZUzJD0hx97r43qw33QDHkRtKRxG5a0Ougb64jCG8yHIPpW+ApfCRGBK
         hJ7cvOtP7k59DJRSdQ9AOpHNR5KsGnjGYHfohYj6gramMuT9eLAks0rtTTzmo2Wb+1nv
         jBQg/UIQEGM087883bJR1HoEKyIWWhkhIwCkKMHnTsrWZrT2hrHPrhQ4bo6JXoR7S7J2
         kdkw==
X-Gm-Message-State: AC+VfDwJ1NnQHqZAttYN6AMJcxciAmcMyGXPLz7IThCTZmhALAycsDSc
	ziVVP/4gRIv9z/dV1BCe+Hqaq5GuBDZFMgq6w/n0wHckh8V3/hu3FvIZjhUodq8Dp4ceZpr8y4v
	ciPxFMAH5mqEv0CuFyUVg+qj1zpLQ+gTtEA==
X-Received: by 2002:a5d:6a88:0:b0:30e:56ae:c8b6 with SMTP id s8-20020a5d6a88000000b0030e56aec8b6mr318424wru.46.1686078600671;
        Tue, 06 Jun 2023 12:10:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ51DIH7HZB9x0XxceoDXhB297Gih/Nbf/mgloResHYXCIsESoaRX7mdtwQ3O/wNKp+njdnDlw==
X-Received: by 2002:a5d:6a88:0:b0:30e:56ae:c8b6 with SMTP id s8-20020a5d6a88000000b0030e56aec8b6mr318409wru.46.1686078600345;
        Tue, 06 Jun 2023 12:10:00 -0700 (PDT)
Date: Tue, 6 Jun 2023 15:09:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: virtio-comment@lists.oasis-open.org,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com, alvaro.karsz@solid-run.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com,
	stefanha@redhat.com, Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>, jasowang@redhat.com,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com
Message-ID: <20230606150920-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230606175511.2337208-1-eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio Pérez wrote:
> This series allows the driver to start the device (as set DRIVER_OK) with only
> some queues enabled, and then enable another queues later.
> 
> This is the current way to migrate net device state through control
> virtqueue, in a software assisted framework with vDPA:
> * First, only net CVQ is enabled at DRIVER_OK
> * All the control commands (mac address, mq, etc) needed for the device
> to behave the same as the source of migration are sent
> * Finally all the dataplane queues are enabled.

In my opinion, this is somewhat problematic. Specifically, currently
devices tend to deduce how many queues are needed by looking
at the state at DRIVER_OK time.  
                                 
Question: what is wrong with enabling queues initially and then
doing a reset right after DRIVER_OK? You can even allocate
memory for just one queue (zeroing it out).

Granted this looks kind of ugly but side-steps this problem with
no need for spec changes.

> Eugenio Pérez (2):
>   virtio: introduce selective queue enabling
>   virtio: pci support virtqueue selective enabling
> 
>  content.tex       | 15 +++++++++++++--
>  transport-pci.tex |  4 ++++
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> -- 
> 2.31.1
> 


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

