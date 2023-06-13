Return-Path: <virtio-comment-return-6318-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DFFC7EE29
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 07:50:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B2C587912B
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 07:50:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 981D498657D
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 07:50:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7FA9C9842EA; Tue, 13 Jun 2023 07:50:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6CAB098653E
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 07:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: r5tacOITMXadqdSs9kV8jA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686642633; x=1689234633;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DfLxWqjFcqnBQbSp5FLt8x+7Bqgvdir6/BDmVcPWyg=;
        b=e2sbVqcAfz8wrCC5BT5O36sSahTUUTRHGDR5iuNP8j48WfhTAbXC0Nn28JRTzroxGt
         qo5HCH/vU43lIGlGT/CpxfatUbiMWPhqKTldGvc0f2jFJgkdBBv5rrE4MPovQnTZanLQ
         Yr6Zv/JQbl4w4HaAmCXy41zG59q2F8gJD3s69W6PorZJVVrCTPGbDH6ksE7E5BW6WO4w
         h+vbDpoSnfRZCGikiIIhqwoJc3FMM8fnrG/uzCcQi3Xk+debV85cmhbUMkwHfIsCGwlR
         iDZVXr/i7CX+ordiFNi/WlyAykioRi0zg4ygZomQdt5jyHdo/2hhKmCxZqBkpc5CbKr1
         T9VA==
X-Gm-Message-State: AC+VfDwHe8OwtRKcMjcxOBCtUkoduSp/SQiTfIowEtjxISfFBR40+4f2
	QdSQVxZKvyhfC57buB3DItZs0cNpgYY8DL5MUzkyGvYJXmpnyC1DjdgGCjL/NkjwEeMF/BnOKE1
	ReK0F/P7/bzjK3T18MqdThrPzn9TwuNafcA==
X-Received: by 2002:a05:6214:5009:b0:62d:eb51:b783 with SMTP id jo9-20020a056214500900b0062deb51b783mr6473718qvb.26.1686642633031;
        Tue, 13 Jun 2023 00:50:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6GHmh/M7mqfblkrL3ZCd937WNU2U719MzJVcR41zeQR/MOXw9+2FzOqM6Fd4K2wM7dcT0pqg==
X-Received: by 2002:a05:6214:5009:b0:62d:eb51:b783 with SMTP id jo9-20020a056214500900b0062deb51b783mr6473702qvb.26.1686642632797;
        Tue, 13 Jun 2023 00:50:32 -0700 (PDT)
Date: Tue, 13 Jun 2023 03:50:12 -0400
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
Message-ID: <20230613034645-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230606175511.2337208-2-eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH 1/2] virtio: introduce selective queue enabling

On Tue, Jun 06, 2023 at 07:55:10PM +0200, Eugenio Pérez wrote:
> This patch allows the driver to start the device (as set DRIVER_OK) with only
> some queues enabled, and then enable another queues later.
> 
> This is the current way to migrate net device state through control
> virtqueue, in a software assisted framework with vDPA:
> * First, only net CVQ is enabled at DRIVER_OK
> * All the control commands (mac address, mq, etc) needed for the device
> to behave the same as the source of migration are sent
> * Finally all the dataplane queues are enabled.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


I realized I never asked. *Why* enable CVQ so early?
I think it's so that commands take effect before any
buffers are processed? So maybe it's a net specific
issue?

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

