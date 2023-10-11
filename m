Return-Path: <virtio-comment-return-7668-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E65ECDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 19:51:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ABC717E2B0
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 19:51:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 87B08986836
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 19:51:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6FB71986608; Wed, 11 Oct 2023 19:51:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D67698660D
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Oct 2023 19:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: r04DYU-DN3qPMTGbp6O_XQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697053902; x=1697658702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5btbGk8u/IWs0odP3eznpVPUwQYzBFU/LROS8lhLO/s=;
        b=Mte5pO/RtNj7OPRUxgA+/wOqKenCEq1P9pB0R/lRiGQF9wXI56mbXJoSUKUVUBQ7g8
         CeEtsej/UyshPWAnZ34aE7UZ8VIHfhagc6QK6RCUJepXEI+cksROF0ptuz0+jnAV/c/L
         y+RlE/Nd2KBGwkMnlHpOGZpiPWC7BUUqJgZjGilM7k54KA505fHU1lZAhrigsfIhVUoQ
         m3UnOTW19435PNaiyVuQobXYaZ4VzHSIkUkcOlIZLq6WnD2fzeNDse7YQqaATK6ZjRzn
         apLI3MT23gB3VFpx6HI+IdC5NDfRao0gvgx2Gc++GjD8wWNc7hpMI0MHgyf1rVEJ34dc
         6uPA==
X-Gm-Message-State: AOJu0Yzz6bvhRlYn5FJ2RSu29EHMHGEFXwsOJKLkGEqZXcbzstjC7RN3
	7L0wMjS/CFe//McYICdbTYDQfvXJIe2JTYtgX291KzXUug/Px33GzGb9MM0uMUs1/Xq1Mi/2tL8
	BADdneoXX+Uk8TYDomrT7ClcrXzN/0B0MPA==
X-Received: by 2002:a05:6000:1b08:b0:31f:d4ad:544c with SMTP id f8-20020a0560001b0800b0031fd4ad544cmr20447735wrz.52.1697053902700;
        Wed, 11 Oct 2023 12:51:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxBaC8ta60pYVvu7ZFj3v0X6OeR9Yc/RnKSIp8Z0gjYN58+OpMtY/Abzd8x1hbRqQ+NRcUaA==
X-Received: by 2002:a05:6000:1b08:b0:31f:d4ad:544c with SMTP id f8-20020a0560001b0800b0031fd4ad544cmr20447725wrz.52.1697053902347;
        Wed, 11 Oct 2023 12:51:42 -0700 (PDT)
Date: Wed, 11 Oct 2023 15:51:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231011154930-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
MIME-Version: 1.0
In-Reply-To: <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Tue, Oct 10, 2023 at 04:57:52PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 10/10/2023 1:21 AM, Parav Pandit wrote:
> > 
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Monday, October 9, 2023 9:50 PM
> > > > > > One or more passthrough PCI VF devices are ubiquitous for virtual
> > > > > > machines usage using generic kernel framework such as vfio [1].
> > > > > Mentioning a specific subsystem in a specific OS may mislead the
> > > > > user to think it can only work in that setup. Let's not do that,
> > > > > virtio is not only used for Linux and VFIO.
> > > > This is just one example on how these commands are useful.
> > > > It can be useful in more ways too in more OSes too.
> > > > I will drop from the patch commit log and keep as information purpose in
> > > cover letter.
> > > > Would that work for you?
> > > > 
> > > > I don’t have any strong opinion to keep it or remove it as most stakeholders
> > > has the clear view of requirements now.
> > > > Let me know.
> > > So some people use VFs with VFIO. Hence the module name.  This sentence by
> > > itself seems to have zero value for the spec. Just drop it.
> > Ok. Will drop.
> So

This is apropos what?

> why not build your admin vq live migration on our config space solution,
> get out of the troubles, to make your life easier?
> Actually you don't see any technical problems in our config space proposal,
> right?

The status bit one? You enumerated some reasons yourself did you not?
And I sent some right when you asked for help seeing more... or did it go right past?


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

