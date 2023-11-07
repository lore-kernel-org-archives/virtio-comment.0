Return-Path: <virtio-comment-return-8246-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BD8C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:29:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B2F673E588
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:29:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7797A986C50
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:29:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 58D3F9867FD; Tue,  7 Nov 2023 11:29:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A2809867FE
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 11:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qYPzdhs6Ma24rMO3ooe-JA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699356564; x=1699961364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dq+3A/0ePNIruUYJzPjiK8r4OJD9604nwihLCI/ehtw=;
        b=i1WnX7Zrwf/armF95II2C2FOejefC2OxrKj/GqXCSx0TMLvN/eZf0tanzBdduYkbE8
         NDbv0IJv/+17CT5DxctFcpvog3fKdsk1fAfptNcKELDv48Og7uZJrShG7JFncV4P/U6u
         0liXXEpEgkrIEyaGDo8usppBEbtlO4/LIYa9hqDigbxD6UddOxWD4JfgHISspIDdi6vS
         4bFuTCEJwjcLHn5Q/tsMLxI2BJzCxXj7Ioq20J6Wtlzwnr1CSC4Ux4nK4IAPiB9OguE+
         sLvuNG0SYRXAvUayXsqdi8eoK/6TDp62myaLHXKsscPviDtGhPSahVLCEDFz4Q+uO63J
         mY9w==
X-Gm-Message-State: AOJu0Yz3TlBvJxo+OP3iQVvS0raefsZuWYTQY18lrycYLqkCssY3QZ7z
	LdQnkiEHEnkTYUDo9z5P8EkVk/PqM0nC9VKX2nEHwDcPo4hlg8sliSB+1knOv1lTYVtJqX95eKP
	HDFq/jdeM7b2sTmIl7WyxSwUj+Vy/SOMWkg==
X-Received: by 2002:a05:6512:3196:b0:4fa:f96c:745f with SMTP id i22-20020a056512319600b004faf96c745fmr31116410lfe.38.1699356564618;
        Tue, 07 Nov 2023 03:29:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAwpKCHiOaT4C0gl0msKqzEYszpu6V1XoW/sAAZXx1amWHIsO9OZlmc4eiVyp37E93uSpkDA==
X-Received: by 2002:a05:6512:3196:b0:4fa:f96c:745f with SMTP id i22-20020a056512319600b004faf96c745fmr31116395lfe.38.1699356564291;
        Tue, 07 Nov 2023 03:29:24 -0800 (PST)
Date: Tue, 7 Nov 2023 06:29:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231107062817-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <a9103f82-c95e-47a6-9284-667c1c991aba@intel.com>
 <20231105111232-mutt-send-email-mst@kernel.org>
 <e139335c-3d51-4f75-b686-34681120e4ff@intel.com>
 <20231106051550-mutt-send-email-mst@kernel.org>
 <82295873-4b56-4884-90b2-f5072813e114@intel.com>
MIME-Version: 1.0
In-Reply-To: <82295873-4b56-4884-90b2-f5072813e114@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty
 page tracking

On Tue, Nov 07, 2023 at 06:44:46PM +0800, Zhu, Lingshan wrote:
> > Intel VT-d supports PML from the IOMMU? I didn't realize. Could you help
> > me find it in the doc please? Which hardware supports this in the field?
> > What about other vendors?
> Please refer to intel vt-d spec:
> https://cdrdv2-public.intel.com/774206/vt-directed-io-spec%20.pdf

Yes I know where the VTD doc is. But what chapter do you refer to
when you say that VTD supports page modification log?

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

