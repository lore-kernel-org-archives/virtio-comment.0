Return-Path: <virtio-comment-return-6973-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D843C00528
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 12:10:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B413D78DA2
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 12:10:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0D799866D8
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 12:10:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A6A93986636; Wed,  2 Aug 2023 12:10:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 952F598663F
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 12:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: VZXRjxP3MfyIXFrEaoiwKw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690978246; x=1691583046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANhwzeFqYL/pz8zQAToGm+99+nWvMemBYeIa7858H64=;
        b=RAXY4p7L188pUV9ymb3ay14ifIaK8izuMK9ARzp4bILZcGcAJWfs14xb9DM31+58yV
         i6LJrkd5Bs4zgOtjjZM70OuhjVf++QZZSDWsncJQqyvy84ELmBIHYGaSuluB6++pt/Gh
         tLxbra6lfKI70cS/zMVtcfyVOWuyZq9Y2HY2AKlVZMNC3D/SzNxoRPglVNydHLj73J0T
         p0et8Vs6HuB5VqvvTpCM4XoFVWuNLtwG/lefjAZ0IKJDCMzxffXk8/IRpGdOn2+EbG0y
         dNpbsnZLU0LPUbaHWSsLMsuTRWhohLCRxTQszSazoNF/XXCc7vDNljzTwwwYXFtHQf45
         COmA==
X-Gm-Message-State: ABy/qLa3ZQse6LkiegWBSssEuDqXCAZkfmF1v/HPL4VlLKOAZ5oe8blm
	yEs4yNkcsZ/svI9SCLc8pvdtH22sgiSjgX4Ok1IzftXAw9zHB/Q38tuyiAeoUpDZwuN5of2GeZ5
	BHaIOPnxJf5cx9P6JLu2jIDBpQO3TtVfMiD7aYpT4iw==
X-Received: by 2002:adf:fa91:0:b0:313:f399:6cea with SMTP id h17-20020adffa91000000b00313f3996ceamr4737548wrr.4.1690978246526;
        Wed, 02 Aug 2023 05:10:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE61k3REWkwqBkDFa5NW7mgNBAX/rIGoZsVsI7624yGzGOyzlCA/U7lNFxsRTBijBOe6PlkKw==
X-Received: by 2002:adf:fa91:0:b0:313:f399:6cea with SMTP id h17-20020adffa91000000b00313f3996ceamr4737524wrr.4.1690978246195;
        Wed, 02 Aug 2023 05:10:46 -0700 (PDT)
Date: Wed, 2 Aug 2023 08:10:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Message-ID: <20230802080959-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802000955-mutt-send-email-mst@kernel.org>
 <3b88c1fe-a5c8-7bc3-b30b-5babe741ffb9@intel.com>
 <PH0PR12MB54813732BE7EA68DC440D981DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ab1aec70-2016-dbdc-3707-c95b185dc1e6@intel.com>
 <PH0PR12MB5481E0E5AFEEEAA10FDBEFDADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802073108-mutt-send-email-mst@kernel.org>
 <DM8PR12MB548060C7A27EFF9719FD1987DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20230802075306-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54800DA6273ABD4019720C79DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB54800DA6273ABD4019720C79DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: proposal: use admin command (and aq) of the device to query
 config space

On Wed, Aug 02, 2023 at 11:58:31AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, August 2, 2023 5:24 PM
> 
> > > 2. Build SIOV device ground up that does not need to have existing limitations
> > of 1.x.
> > >
> > > The transport VQ proposal 4 patches had heavy inclination for #1 without
> > mentioning the real objective in the cover letter.
> > > I was proposing that when virtio builds SIOV device it should start with #2.
> > > Because #1 is sort of handled with sr-iov or vdpa already.
> > >
> > > #2 is more critical to get it right, after SIOV R2 spec is defined.
> > 
> > 
> > Can't we address both? E.g. use a different group type.
> 
> SIOV device is just one type, serving two kinds of commands one for supporting backward compat, second for newer interface.

Not sure about specifics but we can have two groups e.g. SIOV-compat and
SIOV-passthrough.


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

