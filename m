Return-Path: <virtio-comment-return-5500-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CFFC77B76
	for <virtio-comment@archiver.kernel.org>; Mon, 17 Apr 2023 20:27:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 013979F4E9
	for <virtio-comment@archiver.kernel.org>; Mon, 17 Apr 2023 20:27:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5F739863EE
	for <virtio-comment@archiver.kernel.org>; Mon, 17 Apr 2023 20:27:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D442A9863C7; Mon, 17 Apr 2023 20:27:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BE3649863D7
	for <virtio-comment@lists.oasis-open.org>; Mon, 17 Apr 2023 20:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: tEHJBqg0NxSG2n1Lo0B7LQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681763218; x=1684355218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSx/J/mUUeBzx5Nh7Un2GxCH2xQrTXANhPYTo7//qJA=;
        b=SCU/uzZpNjS8GI5iQkAbHn5W0nQX7y3h/rUqfdGFG9C8PZ03ODZq0VyEJ1vbHaGevK
         RH19giWe2mqTM77/NU1gBk+3edhKgYAkCbJ+J0SYlTwh508udSolhTar43WJdqcHr5De
         yI0U7i3Wp3T8njIohPX58GDzdvsYWfOxQET7tgqZDBRpqidQG7yLhfawM/4QyhKxjMxv
         qeHOvlQr4as6umGbZxCzMoVDAbqyJqElWZ+UImmbiqYmBfBkQAfk1BY7xaIZ9kHMP5oy
         ck4kD7vdQ90a46cjMgChzQoHI/wP/5niwPNFeg+EPjee/pjoeCSmSH2Cmi+ZuXlMAWtQ
         P4kQ==
X-Gm-Message-State: AAQBX9eysBVPTFFVBnEBWwg2aaUYd6O7j54HyZBxgE068a/2xgHnLsdN
	fCERWoayGG6ZCZklDPK7WSnHw5lvzZ6bTAT7GXMihEMxDL2Gt4ELeA9ZA0Eyg2/7aedkn2FZ8hh
	uT2MVvbgBQu37WLmTeM7xqKGcc3JKUdFAcw==
X-Received: by 2002:aa7:ce06:0:b0:504:b325:bd4d with SMTP id d6-20020aa7ce06000000b00504b325bd4dmr168402edv.12.1681763218680;
        Mon, 17 Apr 2023 13:26:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZZRE7BGdxuXpIwatf+V2PsXXr5Jo+DdUGrZUIo1r0iZUbgOftriaj9SMSQN/W6e+lIV9VK1Q==
X-Received: by 2002:aa7:ce06:0:b0:504:b325:bd4d with SMTP id d6-20020aa7ce06000000b00504b325bd4dmr168384edv.12.1681763218332;
        Mon, 17 Apr 2023 13:26:58 -0700 (PDT)
Date: Mon, 17 Apr 2023 16:26:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	Yan Vugenfirer <yan@daynix.com>
Message-ID: <20230417162618-mutt-send-email-mst@kernel.org>
References: <a74d3107-d38c-df15-e2ff-f848635f24bd@nvidia.com>
 <CACGkMEt+bGN7UYEopXPj0+deAnYm1VUNp05VvGHcJnkd8LzbGg@mail.gmail.com>
 <20230413130326-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819A5D8FCEC6375D80897DDC989@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvSSXyXQnRs=OiaSJnSEYHP83chL6-B5ZPCGx6TeW9W5Q@mail.gmail.com>
 <PH0PR12MB548135CF5268D979A6D8EDE8DC999@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsHtC99kTTa0TrfeJuhV+F7e-WF7XRgbLJkCBQeAxW8pA@mail.gmail.com>
 <PH0PR12MB5481C29561D5E48BA5D8AEEEDC999@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEseO=4xDA+pH2x=CaJ6XyzHEx1ZFO-+uevJH50kLeSWhA@mail.gmail.com>
 <PH0PR12MB5481FFC95F54AD048927FF12DC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481FFC95F54AD048927FF12DC9C9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Mon, Apr 17, 2023 at 05:23:30PM +0000, Parav Pandit wrote:
> > Things might be simplified if we use separate queues for admin, transport and
> > legacy.
> > 
> Do you mean say we have three AQs, AQ_1, AQ_2, and AQ_3;
> AQ_1 of the PF used by admin work as SIOV device create, SRIOV MSIX configuration.
> AQ_2 of the PF used for transporting legacy config access of the PCI VF
> AQ_3 of the PF for some transport work.
> 
> If yes, sounds find to me.

Latest proposal simply leaves the split between AQs up to the driver.
Seems the most flexible.

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

