Return-Path: <virtio-comment-return-5914-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24539C7EE24
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 17:44:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3DA031462C9
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 17:44:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 157C798651C
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 17:44:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 00D849864EE; Mon, 15 May 2023 17:44:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E138C98650E
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 17:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: NEvoZlEGMiOvzPDvQZiytA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684172693; x=1686764693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynBZHqtMluZubVdFT50w4/fqWxmotBQ0cyJ5q8QKIiw=;
        b=f/EEt/xNQFDC7JBANgzD1y/+tAjldAyPwoAh8/6v0vlKZBkJ07PypqiOeFWG3Cg/7R
         97iHFr7WVB5rm0Xk1nU9H8KDJIBB6GLXPXdGyHFxeB4nVGIiZgWxAIwbg4XlWT6x5mqj
         DVbLhNB8avUuSe0DD7V1a9XJNcGi2TOC7yzC+nxU7dWLwZ9H2YSDgAOnQhQef2bhHBPX
         geHEO57LiCKpRDpGgMxG6PulpCxrUo78p/CwUNQvR35aDu36TK5YlQX6sqFTfWLQLGaM
         pp1O3bc5HJc9ZgvLzXzUWN6Qzjim+jrCQiDC1uaXUOxKQpGx1aiSiq+QthWMqvPwPqAA
         4Uog==
X-Gm-Message-State: AC+VfDwwxUjKgRjvgu1nqDAJDvdc8ry83wuIBU3vosBfTKFtLRxuhMgZ
	EH+JsP9nHrFY65cxzymbezA3HY57hZQyjUX50iHkU5Is6+5iE0pydJ4NSA2ZMi/8ETKi1dEwqtC
	p0Wy8bONIN0IPY/joyc4catpX9ubwxYZxmA==
X-Received: by 2002:a5d:550c:0:b0:2f6:987f:a0f5 with SMTP id b12-20020a5d550c000000b002f6987fa0f5mr22899486wrv.5.1684172693384;
        Mon, 15 May 2023 10:44:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58UeE+VJ1UvYzVWCe9tMrELR08hgwYbTjRVaUfUPBJiy3ixLDzbqnyS4p9jLiS9asiIjckkQ==
X-Received: by 2002:a5d:550c:0:b0:2f6:987f:a0f5 with SMTP id b12-20020a5d550c000000b002f6987fa0f5mr22899466wrv.5.1684172693082;
        Mon, 15 May 2023 10:44:53 -0700 (PDT)
Date: Mon, 15 May 2023 13:44:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230515133719-mutt-send-email-mst@kernel.org>
References: <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <20230510014534-mutt-send-email-mst@kernel.org>
 <43ec1c8d-7d11-2400-3649-1fe366b1e21b@nvidia.com>
 <20230510121417-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F030A76141320F03956EDC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481CEB307F413E53B03D502DC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtm5AS50YmPi6A5=gzZZ9Jm55NEJ3GKOTzv-Z0m5E5J_w@mail.gmail.com>
 <PH0PR12MB5481DE0569EC53A862A4D2E9DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
 <893b6ec0-a74f-69b7-95a3-988f0f9382a8@redhat.com>
 <PH0PR12MB5481CF52380D414AFFBA6A9FDC789@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481CF52380D414AFFBA6A9FDC789@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Mon, May 15, 2023 at 03:49:44PM +0000, Parav Pandit wrote:
> All legacy interface via AQ.
> All modern interface access via PCI or its own transport between driver and device.

I am wondering however about the hypervisor notifications.  Generally
these are the most problematic aspect here I feel.  For example, how
does it interact with VIRTIO_F_NOTIF_CONFIG_DATA?  And generally, having
both guest and host be allowed to access device's BAR seems problematic.
Can we reserve a PF BAR region for these things or is that too
expensive?

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

