Return-Path: <virtio-comment-return-4803-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032BDC678D5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 15:22:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4F3B72AED2
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 15:22:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 373DA9866F5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 15:22:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2193C9866EE; Wed,  8 Mar 2023 15:22:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0EBB69866F0
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Mar 2023 15:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 7vcrr5mPPeq7jllZ5NX_eQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678288916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saJ4pPsgDsXQkaOjsRYMxTC5cHVGJHsSeSbUOlrYGew=;
        b=4QyE+9qOUaqjN62XgQRm7GgY1A+MuuoOD4fQZb7FHq/1kUxD3CuoGDpmY+pkipjdu/
         Un26Wtb+w501ohCYRoTVpExkdknR4Th87U3VhxV1Daj8sdluONSr9H4BGlMBvJiwNFQ+
         qQry1Xh89xWxnoylf9wt9pO6FyE6zbxPuyf6RLY9XrxgRtJ+R4Ketx8zJlbAjsig5BJs
         MWbau7nrozzEaklbfmcGbLCREVH9PYoAmnJUqPHhA1kr5CUqyAU7JsIyPgVc+iUsqz7s
         W6/HC0SDXJcG9i/rWp7ttTrzEONpqzc2G42SfbxWQggBOdun+Drn2aSvOYwKqzf5FdgW
         HLJQ==
X-Gm-Message-State: AO0yUKUmaltWPnPJIb4MEkXW1ZT0xNI44k9V0J3vithR4DpsX5NZ45dL
	+GdX1ZQC4/IzVsg+9y2Siz9Ixkvz6fozA6LcWT67ZXrAw2kY1AJiAGLBR+l+i5L2pJS+uftwWaz
	LerFdkGb4psND2HGgDMEod79skg05wQ0BeQ==
X-Received: by 2002:a05:600c:444a:b0:3e0:6c4:6a38 with SMTP id v10-20020a05600c444a00b003e006c46a38mr8366138wmn.33.1678288916761;
        Wed, 08 Mar 2023 07:21:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8rWkiwfHtXM6IioIGXEhVA9pS05fxsaaVvIoNE70fGe46izDNznA1yhzf1Jv44ojwKhaZSWQ==
X-Received: by 2002:a05:600c:444a:b0:3e0:6c4:6a38 with SMTP id v10-20020a05600c444a00b003e006c46a38mr8366123wmn.33.1678288916510;
        Wed, 08 Mar 2023 07:21:56 -0800 (PST)
Date: Wed, 8 Mar 2023 10:21:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"nrupal.jani@intel.com" <nrupal.jani@intel.com>,
	"Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
	"hang.yuan@intel.com" <hang.yuan@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230308102123-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548116853CAC23DF9CA7345EDCB29@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230302201912.GC2554028@fedora>
 <20230302185803-mutt-send-email-mst@kernel.org>
 <20230303131703.GB2866370@fedora>
 <20230303081900-mutt-send-email-mst@kernel.org>
 <4f869944-4ccd-c51e-0f30-dc3ba15ffd52@nvidia.com>
 <20230307192752-mutt-send-email-mst@kernel.org>
 <6668fd7a-3eb3-0447-9cbf-72d308b1336a@nvidia.com>
 <20230308070531-mutt-send-email-mst@kernel.org>
 <992e9a1e-3799-842c-79f3-e66f5c823356@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <992e9a1e-3799-842c-79f3-e66f5c823356@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v10 03/10] admin: introduce group administration commands

On Wed, Mar 08, 2023 at 03:05:50PM +0200, Max Gurtovoy wrote:
> All drivers in SW world ? All drivers in Linux ? or Virtio drivers ?

Most of the above.

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

