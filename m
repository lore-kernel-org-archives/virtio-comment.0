Return-Path: <virtio-comment-return-5352-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A755CC76196
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 20:06:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ED43F60272
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 20:06:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3ED129866B0
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 20:06:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1F7489863A7; Mon, 10 Apr 2023 20:06:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 967DF986353
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Apr 2023 20:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Vw4wPRC6PSu_ht9FTxkPxA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681156988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWqO8lZwvoIfHBPLApzezXCaGPErmPUZqXD5VxgPQl4=;
        b=UFEj3LiU/cPpvONenEUyLx7g8mG6uJxjGKTNLuIugi7EkCFmITltC+3v/jkv3gG338
         KsO6gYRH+4YT2Zjb0LM2uWJzn1ID1a/A6gS2tLQszm2ixrZZFJp6upxMiymcUoH5Sx+f
         CBVcMrCtfif0mi3ZPl/iN146+Wf2E+v4OI8rfwrAN0grgVincaVOJR4I+Kzppuv9hBOH
         duoJuHRc1L0kxLTgKa2g9NjzDz8UtUU2lyUXed4tofMIYTPBYwwyHUHlu1f7Kd2CQPZJ
         R8l+Ful4k/pFSigkZzCPlIPTHd6AoHUOU3NVPpbkc8SCBNlNZ7f2LtmhoZ5eLMJpsMCP
         eSmw==
X-Gm-Message-State: AAQBX9dVQbBiWyS28xafm8FNUeloYtwSVLtC0WszLstzmpwMXhGKBSRO
	MoURQlfqSsTuUpThAw7gGsixLvpehvpZA2VTFOlYmeuepNiRmYqnEcV0Y2yiH0X7BikIWifISkJ
	izeDMYWNzynXqrUjkqaT1tZWyT6Gl6vHhIA==
X-Received: by 2002:a1c:4b06:0:b0:3ee:6cdf:c357 with SMTP id y6-20020a1c4b06000000b003ee6cdfc357mr7283303wma.20.1681156988085;
        Mon, 10 Apr 2023 13:03:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350YYnNepyLMLMpTl2piXvLvkUKXtKKi83ZalM0N9AxceBV5+YW2dpzkH8bUj8TbGGeQwArT/6g==
X-Received: by 2002:a1c:4b06:0:b0:3ee:6cdf:c357 with SMTP id y6-20020a1c4b06000000b003ee6cdfc357mr7283292wma.20.1681156987753;
        Mon, 10 Apr 2023 13:03:07 -0700 (PDT)
Date: Mon, 10 Apr 2023 16:02:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230410155819-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-9-parav@nvidia.com>
 <20230404032922-mutt-send-email-mst@kernel.org>
 <87jzysjd4g.fsf@redhat.com>
 <20230404084126-mutt-send-email-mst@kernel.org>
 <878rf7kcna.fsf@redhat.com>
 <20230404102053-mutt-send-email-mst@kernel.org>
 <fce3c697-55a6-1410-2f42-db6499bd8f87@nvidia.com>
 <20230410154518-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548109DAABB563E4DA3040CADC959@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548109DAABB563E4DA3040CADC959@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 08/11] transport-pci: Introduce virtio extended capability

On Mon, Apr 10, 2023 at 07:57:08PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, April 10, 2023 3:49 PM
> 
> > Attribution is nice but Signed-off-by is not that.
> 
> Then what is Signed-off-by for virtio spec?

we never defined it. using it kind of by 

> Can it be same definition as what Linux kernel and many other projects use like [1]?
> 
> [1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html?highlight=signed%20off

That is DCO. useful for linux pointless for us as is since
we want people to agree to our IPR.
Unless you want to make DCO refer to our IPR.
That might be possible.
We will need to float this past OASIS stuff.
I prefer explicit agreement to license personally.

> > And fundamentally people go read the PDF where the Signed-off-by does not
> > appear at all no one pokes at git history.
> When people read PDF, they do not care about the sign-off. Signed-off-by is not for that.
> 
> > Let's just do:
> > 
> > Thanks-to: name <email>
> > 
> Why to now learn a new term?
> Why terminology of [1] is not enough like AQ status codes? :)

I have no idea what problem you are trying to address.
If it is attribution Signed-off-by is not that.
If it is IPR Signed-off-by is not that either but might be
made to imply that.

> > if you want attribution.
> > 
> > will be helpful to fill in the thanks section in the spec and does not mention
> > signatures.


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

