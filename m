Return-Path: <virtio-comment-return-4775-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C80BC678D5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 11:55:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D7C6A2B028
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 11:55:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B8B8D9866F5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 11:55:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A175A9866EE; Wed,  8 Mar 2023 11:55:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8CE359866F0
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Mar 2023 11:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GbeEB5UWNp6LO2sDCzUXnw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678276497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4hZo98+UXQ+0kYz5lbRPjykRGCYM7w+Ao/3kZ+T1SA=;
        b=UBKvmhAykcccCw2I3QvzITil1tg9NrYJzaXHA5eKjRHSDPxo5makF8NznP+20zLkDy
         xMPQTySaJu7+pVQh8SKq/I3/TMUfErocrMj0Vzwx6uN23+lKEHgeeqy2v2Jj4D88cb0T
         VXlZx/y4vvudBYcUcP3C7kGE4CtT8kE6youGsgldxyJk0n1W8tbS8u2cqmz6ehjql5//
         OFhEE0DIefLQ1pyplIE5nVAP6LjtiLNhzikbWAuADm+u1Y927JRycHRehZS3x93CT9Wt
         wL14JxTz0PHceReOxKJNQCHT65URNXwnW5/pFTrsncvfWyrqIBQ/y96l0awks3DrIkQC
         il6w==
X-Gm-Message-State: AO0yUKVdq6dYHrUzTYDL4BY/jHvr6Hkp2nMaP7Hpa9oJWACB0t//xn4e
	IV6GQL/6ghZJIdM4bN5bQ+QgYvgfo205HdkpTJP5Kt45ZGy5YQSHdC9dzDMWh49UKb6IpTB7IVA
	w/fbMwzi0iDBWzK7qFYJermzgWBexOhqX0Q==
X-Received: by 2002:aa7:db53:0:b0:4ab:15d9:2dae with SMTP id n19-20020aa7db53000000b004ab15d92daemr17162605edt.14.1678276497714;
        Wed, 08 Mar 2023 03:54:57 -0800 (PST)
X-Google-Smtp-Source: AK7set8oN2Nd8KCT+zigHcOBfKG3QAtMWTDA6m4JMvrqlpwVuX8hU7wKPNn2ynfvcHUGFs3Vn+JNaQ==
X-Received: by 2002:aa7:db53:0:b0:4ab:15d9:2dae with SMTP id n19-20020aa7db53000000b004ab15d92daemr17162581edt.14.1678276497453;
        Wed, 08 Mar 2023 03:54:57 -0800 (PST)
Date: Wed, 8 Mar 2023 06:54:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
	hang.yuan@intel.com, virtio@lists.oasis-open.org,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230308065109-mutt-send-email-mst@kernel.org>
References: <cover.1677761896.git.mst@redhat.com>
 <80c4bc60c9119f68b66f5a003564cec719cc1487.1677761896.git.mst@redhat.com>
 <ZAXbBgN2jw8RhE/3@nanopsycho>
MIME-Version: 1.0
In-Reply-To: <ZAXbBgN2jw8RhE/3@nanopsycho>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v10 08/10] admin: command list discovery

On Mon, Mar 06, 2023 at 01:22:30PM +0100, Jiri Pirko wrote:
> Thu, Mar 02, 2023 at 02:05:22PM CET, mst@redhat.com wrote:
> >Add commands to find out which commands does each group support,
> >as well as enable their use by driver.
> >This will be especially useful once we have multiple group types.
> >
> >An alternative is per-type VQs. This is possible but will
> >require more per-transport work. Discovery through the vq
> >helps keep things contained.
> >
> >Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> >Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> [...]
> 
> 
> >+
> >+The driver issues the command VIRTIO_ADMIN_CMD_LIST_QUERY to
> >+query the list of commands valid for this group and before sending
> >+any commands for any member of a group.
> >+
> >+The driver then enables use of some of the opcodes by sending to
> >+the device the command VIRTIO_ADMIN_CMD_LIST_USE with a subset
> >+of the list returned by VIRTIO_ADMIN_CMD_LIST_QUERY that is
> >+both understood and used by the driver.
> 
> To my untrained ear, this sounds somewhat similar to the feature
> negotiantion mechanism. Why the fact that device/driver supports some
> command can't be covered by just another feature? Looks like unnecassary
> complexicity to negotiate supported commands like this.

Absolutely, it is similar. The issue is that a single device can
be an owner for multiple group types.
For example, I think an SRIOV PF itself can have subfunctions with SIOV
as well as virtual functions with SRIOV.
And the set of supported commands might differ.

We thus need a command that is kind of like features but per group type.

As a small bonus as we are building this from scratch, I added
something which was requested for a long time from features
which is blocking access to commands not allowed by features.
With standard virtio features we trust the driver not to send
commands before enabling a feature and this was considered
a maintainance/security problem.


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

