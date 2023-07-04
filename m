Return-Path: <virtio-comment-return-6705-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F305BEB64D9
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 22:17:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5EDEA42562
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 22:17:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42BA298672B
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 22:17:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 39BC898671A; Tue,  4 Jul 2023 22:17:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2585298408C
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Jul 2023 22:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: y5aP__MrNZ-9BHyf61fjuQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688509029; x=1691101029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSeq/wQ9Q+r4g4wmi8c5hy3qT4658zXtgPEnqtDMvGI=;
        b=cfjryAvu/6oPCWpLkO/A2CZ/PkV4ig7mFvaSL6QUdehAxtuncMfWfsrdicisqMstBX
         njUdqrGChUKt7t5CRiLUpw/AIDuI6yrKkz+vtEKwN4EqDdbxWYf356EO3rOUfhcVaTlB
         GR112MO5ZeJeV7WWFIZsifqxeT3dcE+lmTpWrUDYWEPSKQ7vBjjxn8jMCoOE7yKLy/02
         n76UJXKWHSaypKpWy5A+8c25IhO3mYhBs7JSFm6GF6OUM4+YXI2yaV0Zfnx/WtbUwEvM
         cOu2lmHGxWXOhR1FdWdl6HkkKRK+SGwGPj8gQFIWGwwLeWbz0fPeIXo7AkLiufYlEq+k
         7MTg==
X-Gm-Message-State: AC+VfDyDVldMCv5eJpq5G2xe3F5dN8u0sEp3cjWiBZWqfCeXhuc/Ml8e
	fNZq6Ja/WIXgYSBsmV/DEkdKSU12Mb+sCV0yRRLIPxV4KAiayClcUSG7tX/VvmAkodZ0DOwAna1
	kVxS8ryT27kvwSr85BGQwLiHr6z2fdKACWA==
X-Received: by 2002:a7b:cc15:0:b0:3fb:abd0:2b52 with SMTP id f21-20020a7bcc15000000b003fbabd02b52mr12199580wmh.13.1688509029134;
        Tue, 04 Jul 2023 15:17:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ52c6nh4/Lo5umyQBS+26uZNGq0Ho+a79VwnJ9SACa4YLMb1QgJSA6x08JN9XHhQ8unCA1WpQ==
X-Received: by 2002:a7b:cc15:0:b0:3fb:abd0:2b52 with SMTP id f21-20020a7bcc15000000b003fbabd02b52mr12199568wmh.13.1688509028884;
        Tue, 04 Jul 2023 15:17:08 -0700 (PDT)
Date: Tue, 4 Jul 2023 18:17:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230704181622-mutt-send-email-mst@kernel.org>
References: <20230630042006.1569920-1-parav@nvidia.com>
 <20230630042006.1569920-4-parav@nvidia.com>
 <20230704171700-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817F7888F3FAA6F8874055DC2EA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54817F7888F3FAA6F8874055DC2EA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v8 3/4] admin: Add group member legacy register access
 commands

On Tue, Jul 04, 2023 at 10:15:34PM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, July 4, 2023 6:01 PM
> > 
> > In some systems, there's need to support utilizing legacy drivers with devices
> > that do not directly support the legacy interface.
> > In such scenarios, an owner device of a group can provide the legacy interface
> > functionality for group members.
> > The driver of an owner device can then access the legacy interface of a member
> > device on behalf of the legacy member device driver.
> >
> In the last line, I will change from 'legacy member device driver' to just 'member device driver'.

I think it's important to stress legacy since normal driver
that follows the spec does not access legacy interface at all.


> I will fix rest of the comments including having pad bytes after offset and have similar changes in rest of the places.


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

