Return-Path: <virtio-comment-return-5314-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2D5C6FD1D
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 12:03:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8CFF72B151
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 12:03:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78ADA9865DF
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 12:03:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 65E169865D7; Fri,  7 Apr 2023 12:03:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 538E79865D8
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Apr 2023 12:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: E6AZHAtvObiTpTQww_WC7g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680868996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbrQX2QqyfPAmqdMPF3L/CY82M7iP6x2XP8o3yw77go=;
        b=kfkVwsnq12Oc68OxEYemz+Ztt8iEtnMXqnOiprO+GPe8JrHECmJuwNAsmrIgWGomsc
         tSuLZjDeIR7EC2/I8bvVJMmV7cBGwH3gDm9JMeDOoSVr+2UejQr9SnJQ0dleXOELlk2i
         wnUWf4eE4p5Vwo6S3sdpCLK7WrPya/8g+s1E2cw5q0Z/0yVuGAP0irC3NWS/AhCOyAvL
         TRct3HYkjYzx/zfzJAx+vtj7Y7p1y0kzM5JRG5W+iU6rGLDnk9++8Ho/g5Lr07RrS4gt
         ciJD5jYZgxiNxT8+aZEsFGYTIIcOsHvLisiVyZm5fSc7ahbWTJ9s8qQt5AOkD4JA4rCr
         ZZxw==
X-Gm-Message-State: AAQBX9c7/XSxlRB1c4sa2uPgueN0s8GO6/dN4H8lOPcuJkHK5Yavw5fF
	OTgsOn4eICz+l7JF54qvYzHK1dkuNhkx8pGcJlEX0oRalXfDUFGTUIHvLa6szouC4pU42N/yrtt
	arbq+4BS7X8Fq7lrnhzTAMN/rUFyD4MoQOg==
X-Received: by 2002:a05:600c:3786:b0:3ed:2b49:1571 with SMTP id o6-20020a05600c378600b003ed2b491571mr1087383wmr.20.1680868996767;
        Fri, 07 Apr 2023 05:03:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350aEZpnKLW3+Akx97JKZpWHz9avQNpVt5anhAG9dW0Xh1CakUUuwOr+V3JjjTkflMqrp/O0PqQ==
X-Received: by 2002:a05:600c:3786:b0:3ed:2b49:1571 with SMTP id o6-20020a05600c378600b003ed2b491571mr1087367wmr.20.1680868996486;
        Fri, 07 Apr 2023 05:03:16 -0700 (PDT)
Date: Fri, 7 Apr 2023 08:03:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230407074605-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-8-parav@nvidia.com>
 <20230404032700-mutt-send-email-mst@kernel.org>
 <94b217ee-29d9-42da-f2b8-28ced7e64371@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <94b217ee-29d9-42da-f2b8-28ced7e64371@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 07/11] transport-pci: Introduce
 transitional MMR device id

On Tue, Apr 04, 2023 at 12:08:54PM -0400, Parav Pandit wrote:
> 
> 
> On 4/4/2023 3:28 AM, Michael S. Tsirkin wrote:
> > On Fri, Mar 31, 2023 at 01:58:30AM +0300, Parav Pandit wrote:
> > > Transitional MMR device PCI Device IDs are unique. Hence,
> > > any of the existing drivers do not bind to it.
> > > This further maintains the backward compatibility with
> > > existing drivers.
> > > 
> > > Co-developed-by: Satananda Burla <sburla@marvell.com>
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > 
> > I took a fresh look at it, and I don't get it: what exactly is wrong
> > with just using modern ID? Why do we need new ones?
> 
> A modern (non transitional device) do not support legacy functionality such
> as virtio net hdr,

It's all a question of terminology, but it is not worth
sacrificing functionality for cleaner terminology.
Basically most of the spec just talks about the legacy interface,
and will work fine with this.

Yes we do say:
Devices or drivers with no legacy compatibility are referred to as
non-transitional devices and drivers, respectively.


So we will want to refine this somewhat. Maybe:

	Devices not compatible with legacy drivers and drivers not compatible
	with legacy devices are referred to as non-transitional devices and
	drivers, respectively.


This allows non-transitional devices to expose the legacy
capability - having this capability does not make them
compatible with 

Similarly in the conformance section:

An implementation MAY choose to implement OPTIONAL support for the
legacy interface, including support for legacy drivers
or devices, by conforming to all of the MUST or
REQUIRED level requirements for the legacy interface
for the transitional devices and drivers.

we would just remove "for the transitional devices and drivers"
here as now non-transitional can have a legacy interface.

Similarly:

The requirements for the legacy interface for transitional implementations

would become:

"The requirements for the legacy interface"




> device reset sequence.

what is this one?

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

