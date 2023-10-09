Return-Path: <virtio-comment-return-7636-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE39CD6101
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 16:20:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CB91D613C7
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 16:20:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0FE2986547
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 16:20:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 94E0F9864D3; Mon,  9 Oct 2023 16:20:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 50FEC9864F0
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 16:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: AAfIzjTqNwalClRtbqHrdw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696868377; x=1697473177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqz7pXwcqTMqbOXfQoaAz4bJlbKzxP4KdU70+9rJ1Vc=;
        b=BDd7ETFazhQqnoUYd3+DhLfvQ66+519dlPnxRgSzKVw59zGuGHyqXoj3Im5y3Pnhms
         1YaNoSIKB5OY0j418HjwXyJkE1kmu/S4/P/SQB0yvpTjAupYptRNnp/jNKN4FCbU8ny1
         APxJ0gNXUCgjm366OY+oXFdMQTTZQy68teUUfmA1H+lWOXy69jr9XsHzh2gCYFDpCA4C
         yeZYS2SYjlMJ052H4uWY3YNOcDxZlBi39VsARCRksFO+ARaStCtkpdON9u6oAeAP9I6g
         5K0AZBLz4HAqdhEomSPpmn6yN3Y4JMBwnZB2hPhcd7ACMGAYgdHDChMyfgaKkYYTYf2Q
         1A0A==
X-Gm-Message-State: AOJu0YwnFpkqBpttX4em8DP4vSBYIDpQx/xUD/dvPHYzFkKnZT1vFSIq
	04Wmn02H9+0xmj4bqD3hmQQBC+TW44SAYHtoWmKfSi1l/vcqd0OELYBtPLbP2KinFr3kuz1mK2A
	C4BaP5P4vsloZWkrZNI06VMD7nPJ3EsVt3w==
X-Received: by 2002:aa7:c541:0:b0:534:2fd8:a9e1 with SMTP id s1-20020aa7c541000000b005342fd8a9e1mr13698531edr.22.1696868377622;
        Mon, 09 Oct 2023 09:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwo1h3pciz0GdANteG+E4w+nULB9oWepqiUvkFTkcpTAq9lmhhDgZLmgpvX4hPE38c+YOk7Q==
X-Received: by 2002:aa7:c541:0:b0:534:2fd8:a9e1 with SMTP id s1-20020aa7c541000000b005342fd8a9e1mr13698520edr.22.1696868377346;
        Mon, 09 Oct 2023 09:19:37 -0700 (PDT)
Date: Mon, 9 Oct 2023 12:19:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Message-ID: <20231009121638-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Mon, Oct 09, 2023 at 12:02:54PM +0000, Parav Pandit wrote:
> Hi Jason,
> 
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, October 9, 2023 2:19 PM
> > 
> > Adding LingShan.
> > 
> > Parav, if you want any specific people to comment, please do cc them.
> > 
> > On Sun, Oct 8, 2023 at 7:26 PM Parav Pandit <parav@nvidia.com> wrote:
> > >
> > > One or more passthrough PCI VF devices are ubiquitous for virtual
> > > machines usage using generic kernel framework such as vfio [1].
> > 
> > Mentioning a specific subsystem in a specific OS may mislead the user to think
> > it can only work in that setup. Let's not do that, virtio is not only used for Linux
> > and VFIO.
> This is just one example on how these commands are useful.
> It can be useful in more ways too in more OSes too.
> I will drop from the patch commit log and keep as information purpose in cover letter.
> Would that work for you?
> 
> I don’t have any strong opinion to keep it or remove it as most stakeholders has the clear view of requirements now.
> Let me know.

So some people use VFs with VFIO. Hence the module name.  This sentence
by itself seems to have zero value for the spec. Just drop it.

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

