Return-Path: <virtio-comment-return-6941-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B42C001E0
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 04:20:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9923C747CB
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 04:20:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7BCA9986636
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 04:20:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 64110983EB5; Wed,  2 Aug 2023 04:20:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 209AC9865F1
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 04:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: tjCRPRZOPB65wx8Oup9Hdg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690950011; x=1691554811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik6UQseNPkui8utT+vKp+UXjyUE8w8TvNy2SJP36pNQ=;
        b=GWFFvKEqoGCCys3h+Xp2TKPePtUlPftvXC051xaKGqQ+xd8WbuWLIWG7S4XZNmle2i
         pQfQqXlUuSn/q1q+TWtIaiNYXyG+STWYTj+DgSaybCfd1GkSIJ2/40AUg9Bl/SGOIe2o
         vcXUYQHQqjwRMxESsjjNRG6RnKifb4tORpQ3IX3YmUU6vrOgSLHNIIMo+szcOjPe1LgU
         yLo1LFpYGY2mvMfG/e1hXwHLBsH2XcGe2QLYXEW21W2WqbACw7N5WNSkTt4jUxIprWQD
         C93y/r608tzHK4dbw9t2ZXd2FW6W8R7XkD6QCbknW/hedTdpOOk5I+vmJ5wVj/sNPubj
         o5BA==
X-Gm-Message-State: ABy/qLZHwvxNL9ViCMIqusMS+4hnB8PtpfOh4LmzoO6/An48EQJvYyDs
	l3IBTOLNELLPKuBgvfUBtaC9xSGiPn08KfuZK388FkD1hRMV9banVLwbbcas/BSoQLJoodLfgdj
	kt1qxKNiFf/jKfMH8KZtu1XJhXy5kgUwL/Q==
X-Received: by 2002:a5d:68c5:0:b0:313:f8c0:d5c9 with SMTP id p5-20020a5d68c5000000b00313f8c0d5c9mr3474016wrw.63.1690950011452;
        Tue, 01 Aug 2023 21:20:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHmQjUFEtZnWWKsYZvi2/RMHoNcDULvwLYWbndldcWW/IQ+vJKBkcTxskKYncT/uEX2e8OERQ==
X-Received: by 2002:a5d:68c5:0:b0:313:f8c0:d5c9 with SMTP id p5-20020a5d68c5000000b00313f8c0d5c9mr3474007wrw.63.1690950011103;
        Tue, 01 Aug 2023 21:20:11 -0700 (PDT)
Date: Wed, 2 Aug 2023 00:20:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Message-ID: <20230802000955-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: proposal: use admin command (and aq) of the device to query
 config space

On Tue, Aug 01, 2023 at 07:09:14AM +0000, Parav Pandit wrote:
> One line proposal: 
> Let's use new admin command and admin q for all device types to query device config space for new fields. (always).
> 
> Details below.
> 
> Query of device capabilities and configuration using DMA interface.
> Need: 
> Currently device configuration space is exposed as read only registers. It is growing rapidly.
> Some devices may be even multi-functionality device in coming future such as net + clock + rdma device.
> For a PCI transport implementing such ever-growing capabilities, configuration is burdensome as plain registers.
> Hence, it is required for the driver to query capabilities and configuration using a DMA interface.
> 
> Interface requirements:
> 1. Maintain backward compatibility for existing defined configuration fields to stay as registers.

This is both too specific and too vague.  I think you mean "device
should be able to optionally support both config access over DMA and support
existing transitional and non-transitional virtio pci drivers".

> 2. Any new field added must be accessed via DMA interface, regardless of device implementation (hw/sw etc).
> Results in single driver code regardless of device implementation.
> 3. A device must be able to choose, starting from which field driver must query 
> such configuration via DMA interface. This field offset must be greater than currently defined configuration field.

2 and 3 look like implementation more than like a requirement.
Try to think what your actual requirement is.

> 4. Any driver to device query operation must not be mandated to be
> mediated by the owner device for PCI VFs or SIOV or SF devices. Driver must be able to
> communicate query capabilities and configuration fields directly to
> the device regardless of device type being PCI PF, VF, SF/SIOV device uniformly.

I don't really know what does it mean to communicate directly with SIOV device.
neither do I know query is and what capabilities are.

> 5. When having multi-functionality device in future, it is desired to not always
> query all the configuration but may be able to query per-functionality configurations.
> For example, query only steering capabilities, query only rdma capabilities or query only clock capabilities.

I don't know what query is and what capabilities are. Do you mean
"access part of config space"?


> 6. The driver should be able to query config/capabilities without
> polling for the DMA completion, in other words, the driver should be able to get
> notification from the device when DMA command completes.
> 7. The driver should be able to utilize existing interrupt vector and/or
> virtqueue for query and set operation without demanding
> additional interrupt vector whenever possible.

additional over what? existing where?

> 
> There are multiple options for DMA interface.
> Some of these options are listed below that we would like to consider fulfilling above requirements.


Cc: Zhu Lingshan <lingshan.zhu@intel.com>

Zhu Lingshan are you still interested in a transport for SIOV (what was
called transport vq)? Clearly SIOV needs this as part of the transport.

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

