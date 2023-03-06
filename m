Return-Path: <virtio-comment-return-4723-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BFCC6FD1B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 22:48:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EECDA94EE3
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 22:48:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 933B39866F9
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 22:48:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3A71B986709; Mon,  6 Mar 2023 22:48:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2C649866BF
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Mar 2023 22:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Bho62wq2NpSz79JtkhhhyQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678142917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZhg5WDyxSqtE7G3Ys0/5yHajmyUA4lUNSCH3B0pvA4=;
        b=I+AdzAUtdtZj/OrGWD4T/ZxtwD7V3+HOQMW1XnuzhBMhsXWsx6uo2KTrn9vBfaBZYR
         kXQb/lWMv1wXM+b/Gx6MLYazbCNbrX4ydiqaffcNJ7qebo1NycvtBNubz8QDqoVTWfbH
         7hfKmdiPCYyElc7q8KxLP3yFboAThfZRJihdvFk/oHuQC7g3GqzdTWb6ABxJFk0qg8gA
         OLwf7X7d+YZ2i3Fjn0vekkBkBqjlJJryZpyCVYrEIRlumYcu9RqnDKl83nRjUekGZibx
         1ztH/41G9NLg8A4jbFKVcWQOtOk7NpUDAJDmpefX4XGoDSoxeHHmNGsktcsY6kYdVTfj
         cmVA==
X-Gm-Message-State: AO0yUKUlUDXTdfCvGQnTi5Lc4so+YL8r5DOoecQNqWZNAPeOXxTcjeJo
	3yfjryQYzFIu21vzrNsyVNczQCsiv8kwdaSRa4oXieBRz1/TpZ25jkU2KUccNpGjpEsyQHttq2s
	Cjgne2yvT5jhImLUdlMZDzSbR9CAPZ4s6Iw==
X-Received: by 2002:a5d:460b:0:b0:2c9:a800:7d08 with SMTP id t11-20020a5d460b000000b002c9a8007d08mr7927954wrq.43.1678142917690;
        Mon, 06 Mar 2023 14:48:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9iwpCKKLsdYyn8P0TZ3mH4e0buaGZbDniUejFZSGd57oTrTW4JIO+5WDhIAb2ONdm7Z4vsqQ==
X-Received: by 2002:a5d:460b:0:b0:2c9:a800:7d08 with SMTP id t11-20020a5d460b000000b002c9a8007d08mr7927945wrq.43.1678142917384;
        Mon, 06 Mar 2023 14:48:37 -0800 (PST)
Date: Mon, 6 Mar 2023 17:48:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
	hang.yuan@intel.com, virtio@lists.oasis-open.org,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230306174654-mutt-send-email-mst@kernel.org>
References: <cover.1677761896.git.mst@redhat.com>
 <ZAYXZPVulKWDIuRr@nanopsycho>
MIME-Version: 1.0
In-Reply-To: <ZAYXZPVulKWDIuRr@nanopsycho>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v10 00/10] Introduce device group and
 device management

On Mon, Mar 06, 2023 at 05:40:04PM +0100, Jiri Pirko wrote:
> Thu, Mar 02, 2023 at 02:04:48PM CET, mst@redhat.com wrote:
> 
> [...]
> 
> 
> >  admin: introduce device group and related concepts
> >  admin: introduce group administration commands
> >  admin: introduce virtio admin virtqueues
> 
> The ordering seems a bit odd to me. I think that at the beginning, the
> admin virtqueue should be introduced with generic concepts (including
> the generic command structure), only after that the section introducing
> device group stuff and related commands.

That's intentional.

Jason is working on additional ways to pass commands to
devices, using memory mapped registers.

Thus admin commands stand by themselves, and the queue is
just a way to issue them.



> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

