Return-Path: <virtio-comment-return-5328-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A907C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:15:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7B60D2A8E6
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:15:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A08098636D
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:15:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 467F5984216; Mon, 10 Apr 2023 06:15:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B90B986319
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Apr 2023 06:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 88TdLYfgPY6lNxPk-9LVfg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681107301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgKN1CFCIbPBrIWfoZPGnyMqR9jcuaJWNZZ6wVC8IAk=;
        b=7WLeZRongefZ4i6kECn1ufhpMQsGlE8e+3JKuvn74RCX0SiIHYtnQNbl2VWVhE/5uq
         7o5elpQ8Awl/DgbcQnb/Abhl1nfK42dWpEdozAb/K3zBycS0Yiwkgs2k8i0ewaLmgLzu
         RImNl/FApx2h+WUnX/0nTYCPBbXbsHGCHvbSKa5umOiQZF3KeyVOiepaTRKCoJn8RHu8
         +TgBxAgSwXMLbMn4gt1G7kTRhDkX2tfln4hTve3EMRKahtxX7gcjgfCdku24LhuVFxHW
         ubz9kaI8cu2JWb2ipZEPNGQrE/1hgyhEhYphQNEYbQnF21RsV4+qLdsY8xi5FoFSCNlg
         Bc6A==
X-Gm-Message-State: AAQBX9fvqDndmU8r4PVMuC5gzkXY7wBE5n4lfWS6+lvWL5MsWO38CPy3
	lBO1cTEGyBepSW/ep//AYgg1Tq/Jid6iOmUHuE+OFxcS0y/RVBbf/KOtVocD/OGqVGn7i0pwlA6
	oH9+VIrVzxUnSReBP/0Il1dZXCu6ddLwdvQ==
X-Received: by 2002:a05:600c:ac3:b0:3ee:1084:aa79 with SMTP id c3-20020a05600c0ac300b003ee1084aa79mr5355215wmr.20.1681107301589;
        Sun, 09 Apr 2023 23:15:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350bs2Ukuy6eYTykw4jInyYwLWinYsLgQ8dNKJfU5z0p0EbE/qTiUHxVWbR52gLQ9LNdMbdTdQg==
X-Received: by 2002:a05:600c:ac3:b0:3ee:1084:aa79 with SMTP id c3-20020a05600c0ac300b003ee1084aa79mr5355203wmr.20.1681107301278;
        Sun, 09 Apr 2023 23:15:01 -0700 (PDT)
Date: Mon, 10 Apr 2023 02:14:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	cohuck@redhat.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com, Satananda Burla <sburla@marvell.com>
Message-ID: <20230410020906-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-10-parav@nvidia.com>
 <20230407043841-mutt-send-email-mst@kernel.org>
 <CACGkMEtkOdwixxaRz2Pv9xP75vb13ncboX5XRs8NqFCUsS16aQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtkOdwixxaRz2Pv9xP75vb13ncboX5XRs8NqFCUsS16aQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Mon, Apr 10, 2023 at 09:33:32AM +0800, Jason Wang wrote:
> This is fine for vDPA but not for virtio if the design can only work
> for some specific setups (OSes/archs).
> 
> Thanks

Well virtio legacy has a long history of documenting existing hacks :)
But yes, VIRTIO_F_ORDER_PLATFORM has to be documented.
And we have to decide what to do about ACCESS_PLATFORM since
there's a security problem if device allows not acking it.
Two options:
- relax the rules a bit and say device will assume ACCESS_PLATFORM
  is acked anyway
- a new flag that is insecure (so useful for sec but useless for dpdk) but optional

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

