Return-Path: <virtio-comment-return-5381-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA3BC77B70
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:11:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 893462B244
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:11:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C53898638E
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:11:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7142D98636D; Tue, 11 Apr 2023 14:11:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6227E98636E
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Apr 2023 14:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: bzxqBRfoPgqvUB6lTzVTWw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681222268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+54MM3N81uKS+P7N8YYQ94+Kcv0j9wz5fIvEDnpn6wY=;
        b=MTEibPG0UEujMRXSfdObIYL4y0Zw+WjnM/0kyd5/ajR0BIHCmRt84iML8Qk8dknx3P
         O7r18398DTYfhRCQx9Q9lRrmrrMzxzKbwyMDAQQtuvlfHxlDD4ETV1+GRaHxPxKc5o99
         RZqjhV8dWTT8y2ZWp34j2DHF+tdQDUkvPhgtzSGnGIBRkymPTfaoZbAUK9VCYk1MkEZw
         0Nz1kmjdYIFa+vSH9igCuhlDjLXxgfk0eLBPM2liZMpb/H6uDWun8UoAhSBGfOC64Bsi
         91ZwkG5xZFzuZVQvl0BEw+vcYUfQyT+Khl02nTEjVArhalvCE9ehazsRm2ODyVW1CuaD
         hUog==
X-Gm-Message-State: AAQBX9dfbqkkPYapMJULix1yDOmxBZ8ZVBQBrDoSKGmySkDoCD2CT1Cm
	g95JNbeFpS6tVmQmqr4wAye2l4mlivh1xUSg9RM4waSE1pRQ2UJmLregOmn5J91ru50WTCCw0XD
	x3rpaLQt7Y8ONs6VMGPqe8m5ZnGCw/+j25g==
X-Received: by 2002:a5d:4942:0:b0:2ef:ba57:ee2d with SMTP id r2-20020a5d4942000000b002efba57ee2dmr8208972wrs.51.1681222267901;
        Tue, 11 Apr 2023 07:11:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350bO9FXYbqiYy771jSZiEjBTnCYWQ08WyEt3/qnchYDTfxLwHbKBLDQrxwudlwd6mZ9ojkI3ZA==
X-Received: by 2002:a5d:4942:0:b0:2ef:ba57:ee2d with SMTP id r2-20020a5d4942000000b002efba57ee2dmr8208950wrs.51.1681222267567;
        Tue, 11 Apr 2023 07:11:07 -0700 (PDT)
Date: Tue, 11 Apr 2023 10:11:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	cohuck@redhat.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com, Satananda Burla <sburla@marvell.com>
Message-ID: <20230411101034-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-9-parav@nvidia.com>
 <CACGkMEtMOy4B-O-52ka+9P3OBQ_hs1KvdjWodNYg-XKLff+giw@mail.gmail.com>
 <20230410021619-mutt-send-email-mst@kernel.org>
 <CACGkMEsZXozY7iC7L3L9FC+o8dQGY9+Hhbag2Z-G-nxr9BvDdw@mail.gmail.com>
 <20230410055947-mutt-send-email-mst@kernel.org>
 <CACGkMEsKLeJ1q3Vh8h2JYM=-RcrGd+31yR1Zsw0U=SRd1JZugg@mail.gmail.com>
 <20230411025646-mutt-send-email-mst@kernel.org>
 <CACGkMEui1ouE8DcXKkWUavToUT+vEP-c640vtw3BJBOSz5YTkw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEui1ouE8DcXKkWUavToUT+vEP-c640vtw3BJBOSz5YTkw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH 08/11] transport-pci: Introduce virtio
 extended capability

On Tue, Apr 11, 2023 at 05:07:11PM +0800, Jason Wang wrote:
> > now, imagine someone building a new device. if existing drivers are not
> > a concern, it is possible to move capabilities all to extended space. is
> > that possible while keeping the bios working?
> 
> This is possible but I'm not sure it's worthwhile. What happens if the
> device puts all capabilities in the extended space but the bios can't
> scan there?

that's my question. why can't bios scan there?

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

