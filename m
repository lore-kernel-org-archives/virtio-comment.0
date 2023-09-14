Return-Path: <virtio-comment-return-7424-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40429EDE9A4
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:37:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 979B421690
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:37:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D62F98664F
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 11:37:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 837F098402B; Thu, 14 Sep 2023 11:37:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 741F098663D
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Sep 2023 11:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ZYBSeQ_KMP-zlTkkn30Kww-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694691427; x=1695296227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fpcobUAQmNRu7g2td/pu6JTMcmiCHlmgba8nlGvTHI=;
        b=C5LmjtABRPDdBcIGxTrzU4ALhJdjcOT3HnkiCxFjdo6/du020uf2Do980T0ZUQAzhG
         uNXXUwFN5l9qM12xmwJtmWiPXlgMoYTXQSLIlHmwBwN7Ex/tgKUvsNSJeJO7CKZhJn0P
         M8zfInvSZ7Bdp2gH1ImBVg2zeAdy7kemTAq8rdKVd2jqnvvLV4RioOtDgqAQScadh89g
         edKPzb0q7t24r/JQFtYbfHjSrxc8LGuIL/6pSDNaDDjgn/0w8irczx5vhKxsfIZEknhT
         LH9ACKoEarE46Vzhg+nv7iTj9LkysY2wSeGRL3ucDpk2+8SbD0FzjOIMUb2uyLeVMcKw
         Skeg==
X-Gm-Message-State: AOJu0Yxz+hkfbPAwGqAFGzbRegBOMv2/+tyeJ1EDcZ5bRai1jLM7c8P4
	NJ06IzwgOQWiWOsZW8bVxtnKZYFALOfpRoeFfIKC8psGt/H727A3pPF57v4h3I6VhLFkz87hups
	G49xTVYSjTdxWMItdEzOqdSRKTDD1oClplw==
X-Received: by 2002:a17:906:81c7:b0:9ad:b80c:c19d with SMTP id e7-20020a17090681c700b009adb80cc19dmr1464804ejx.56.1694691427512;
        Thu, 14 Sep 2023 04:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEK0oq6O1OoliLiyMC6De+KMMdv2NaSQMRcGmKAxCn6wgwKUff91rKqRG4RmyQ7168QeELuw==
X-Received: by 2002:a17:906:81c7:b0:9ad:b80c:c19d with SMTP id e7-20020a17090681c700b009adb80cc19dmr1464792ejx.56.1694691427180;
        Thu, 14 Sep 2023 04:37:07 -0700 (PDT)
Date: Thu, 14 Sep 2023 07:37:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Message-ID: <20230914073454-mutt-send-email-mst@kernel.org>
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20230906081637.32185-1-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 0/5] virtio: introduce SUSPEND bit and vq state

On Wed, Sep 06, 2023 at 04:16:32PM +0800, Zhu Lingshan wrote:
> This series introduces
> 1)a new SUSPEND bit in the device status
> Which is used to suspend the device, so that the device states
> and virtqueue states are stabilized.
> 
> 2)virtqueue state and its accessor, to get and set last_avail_idx
> and last_used_idx of virtqueues.
> 
> The main usecase of these new facilities is Live Migration.
> 
> Future work: dirty page tracking and in-flight descriptors.
> 
> This series addresses many comments from Jason, Stefan and Eugenio
> from RFC series.


after going over this in detail, it is like I worried: this
tries to do too much through a single register and
the ownership is muddied significantly.

I feel a separate capability for suspend/resume that would
be independent of device status would be preferable.

> Zhu Lingshan (5):
>   virtio: introduce vq state as basic facility
>   virtio: introduce SUSPEND bit in device status
>   virtqueue: constraints for virtqueue state
>   virtqueue: ignore resetting vqs when SUSPEND
>   virtio-pci: implement VIRTIO_F_QUEUE_STATE
> 
>  content.tex       | 118 ++++++++++++++++++++++++++++++++++++++++++++++
>  transport-pci.tex |  18 +++++++
>  2 files changed, 136 insertions(+)
> 
> -- 
> 2.35.3


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

