Return-Path: <virtio-comment-return-8441-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B9BC072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:45:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3EE8A750AB
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:45:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 126F4986E26
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:45:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EE0D2986E1C; Fri, 17 Nov 2023 10:45:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE476986E1D
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Ao7tSKVQPxyNeALIjQ4otA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700217950; x=1700822750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvUEFHI0u3q2uz3/58M9f6oDoY5pS7bCi6rY1HGwwqg=;
        b=NJi2Oex8UCe51c7l3bJamQsytAjVAT06orSsTJvwOvA9J8wL4xT/kAwepufuMJC2Be
         8ygcS9FN0bfaMt7A4zVb140Po7A/gMvuZGow8vuH3O6XpkIbTAzmTwsZ/DGyfZsScqIm
         hhLtfqje4E/HrDb8vkypKB5TvqbHPfc1OvIYlTDbeTJP5s0SMRFdtMV6mdv/wH0mTreA
         mmb9dfGTlmLhloCpz/UMVzKDslBCtqDP7738q8G6CCwE6j+UlkT2EBgSxyMtuIJemDOq
         mGxB1smqVrb78OY09FgI+MeYDgJrgup1DwmlcxatDgUCQq2fuPwLrOC4YFbiNsYs82E9
         2eYA==
X-Gm-Message-State: AOJu0YzU9/pnqsIgy/55Dl475aSFtoFmRWNXMMTm3Ii+gJwAiclSr3it
	RDXG6YsrxTwKz2LVrW/76p4117O/niIGnwxAX5gQAWtWztn9w0lX4XY6Y20csheCZtwDxlsNK7+
	qqDhC85o1F8F5REVGZReP2Xt9Ae79iA987w==
X-Received: by 2002:adf:e8d1:0:b0:317:6513:da7e with SMTP id k17-20020adfe8d1000000b003176513da7emr12459004wrn.36.1700217949987;
        Fri, 17 Nov 2023 02:45:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYG9MBq9ApPmmsKzLBCtIqFDXhbPuBO7+f2GyuD3KDZAszzj3b7WmevGaAWCU6dYDNXYlAcg==
X-Received: by 2002:adf:e8d1:0:b0:317:6513:da7e with SMTP id k17-20020adfe8d1000000b003176513da7emr12458986wrn.36.1700217949518;
        Fri, 17 Nov 2023 02:45:49 -0800 (PST)
Date: Fri, 17 Nov 2023 05:45:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231117054118-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB54801250188E085F6D03869EDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <5bdc33bb-4ad5-4274-9764-69e1887b0d17@intel.com>
 <PH0PR12MB54815431B823C54E3231EC5EDCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bb66298e-9ee5-4370-8532-13110f392f41@intel.com>
 <PH0PR12MB548189E49C97E91374B3F514DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4201d1df-100d-495c-97ba-7efbe73d9137@intel.com>
 <PH0PR12MB54810113B095063A5B875A03DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <166b43a5-b301-486f-9cc4-01a1cc80eed4@intel.com>
 <PH0PR12MB5481F872AE828217D6CC8FEEDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d96aed6b-6194-41f6-9f4a-e20fe29797e4@intel.com>
MIME-Version: 1.0
In-Reply-To: <d96aed6b-6194-41f6-9f4a-e20fe29797e4@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

On Fri, Nov 17, 2023 at 06:02:14PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/16/2023 6:21 PM, Parav Pandit wrote:
> > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > Sent: Thursday, November 16, 2023 3:45 PM
> > > 
> > > On 11/16/2023 1:35 AM, Parav Pandit wrote:
> > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > Sent: Monday, November 13, 2023 2:56 PM
> > > > > 
> > > > > 
> > > > > 
> > > > > On 11/10/2023 8:31 PM, Parav Pandit wrote:
> > > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > > Sent: Friday, November 10, 2023 1:22 PM
> > > > > > > 
> > > > > > > 
> > > > > > > On 11/9/2023 6:25 PM, Parav Pandit wrote:
> > > > > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > > > > Sent: Thursday, November 9, 2023 3:39 PM
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 11/9/2023 2:28 PM, Parav Pandit wrote:
> > > > > > > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > > > > > > Sent: Tuesday, November 7, 2023 3:02 PM
> > > > > > > > > > > 
> > > > > > > > > > > On 11/6/2023 6:52 PM, Parav Pandit wrote:
> > > > > > > > > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > > > > > > > > Sent: Monday, November 6, 2023 2:57 PM
> > > > > > > > > > > > > 
> > > > > > > > > > > > > On 11/6/2023 12:12 PM, Parav Pandit wrote:
> > > > > > > > > > > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > > > > > > > > > > Sent: Monday, November 6, 2023 9:01 AM
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > On 11/3/2023 11:50 PM, Parav Pandit wrote:
> > > > > > > > > > > > > > > > > From: virtio-comment@lists.oasis-open.org
> > > > > > > > > > > > > > > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Zhu,
> > > > > > > > > > > > > > > > > Lingshan
> > > > > > > > > > > > > > > > > Sent: Friday, November 3, 2023 8:27 PM
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > On 11/3/2023 7:35 PM, Parav Pandit wrote:
> > > > > > > > > > > > > > > > > > > From: Zhu Lingshan <lingshan.zhu@intel.com>
> > > > > > > > > > > > > > > > > > > Sent: Friday, November 3, 2023 4:05 PM
> > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > This patch adds two new le16 fields to common
> > > > > > > > > > > > > > > > > > > configuration structure to support VIRTIO_F_QUEUE_STATE
> > > > > > > > > > > > > > > > > > > in PCI transport
> > > > > > > layer.
> > > > > > > > > > > > > > > > > > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > > > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > > >           transport-pci.tex | 18 ++++++++++++++++++
> > > > > > > > > > > > > > > > > > >           1 file changed, 18 insertions(+)
> > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > diff --git a/transport-pci.tex b/transport-pci.tex
> > > > > > > > > > > > > > > > > > > index
> > > > > > > > > > > > > > > > > > > a5c6719..3161519 100644
> > > > > > > > > > > > > > > > > > > --- a/transport-pci.tex
> > > > > > > > > > > > > > > > > > > +++ b/transport-pci.tex
> > > > > > > > > > > > > > > > > > > @@ -325,6 +325,10 @@ \subsubsection{Common
> > > > > configuration
> > > > > > > > > > > > > > > structure
> > > > > > > > > > > > > > > > > > > layout}\label{sec:Virtio Transport
> > > > > > > > > > > > > > > > > > >                   /* About the administration virtqueue. */
> > > > > > > > > > > > > > > > > > >                   le16 admin_queue_index;         /* read-only for
> > > driver
> > > > > > > */
> > > > > > > > > > > > > > > > > > >                   le16 admin_queue_num;         /* read-only for
> > > driver
> > > > > > > */
> > > > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > > > +	/* Virtqueue state */
> > > > > > > > > > > > > > > > > > > +        le16 queue_avail_state;         /* read-write */
> > > > > > > > > > > > > > > > > > > +        le16 queue_used_state;          /* read-write */
> > > > > > > > > > > > > > > > > > This tiny interface for 128 virtio net queues through
> > > > > > > > > > > > > > > > > > register read writes, does
> > > > > > > > > > > > > > > > > not work effectively.
> > > > > > > > > > > > > > > > > > There are inflight out of order descriptors for block also.
> > > > > > > > > > > > > > > > > > Hence toy registers like this do not work.
> > > > > > > > > > > > > > > > > Do you know there is a queue_select? Why this does not
> > > work?
> > > > > > > > > > > > > > > > > Do you know how other queue related fields work?
> > > > > > > > > > > > > > > > :)
> > > > > > > > > > > > > > > > Yes. If you notice queue_reset related critical spec bug
> > > > > > > > > > > > > > > > fix was done when it
> > > > > > > > > > > > > > > was introduced so that live migration can _actually_ work.
> > > > > > > > > > > > > > > > When queue_select is done for 128 queues serially, it take
> > > > > > > > > > > > > > > > a lot of time to
> > > > > > > > > > > > > > > read those slow register interface for this + inflight
> > > > > > > > > > > > > > > descriptors +
> > > > > > > more.
> > > > > > > > > > > > > > > interesting, virtio work in this pattern for many years, right?
> > > > > > > > > > > > > > All these years 400Gbps and 800Gbps virtio was not present,
> > > > > > > > > > > > > > number of
> > > > > > > > > > > > > queues were not in hw.
> > > > > > > > > > > > > The registers are control path in config space, how 400G or
> > > > > > > > > > > > > 800G
> > > > > > > affect??
> > > > > > > > > > > > Because those are the one in practice requires large number of VQs.
> > > > > > > > > > > > 
> > > > > > > > > > > > You are asking per VQ register commands to modify things
> > > > > > > > > > > > dynamically via
> > > > > > > > > > > this one vq at a time, serializing all the operations.
> > > > > > > > > > > > It does not scale well with high q count.
> > > > > > > > > > > This is not dynamically, it only happens when SUSPEND and RESUME.
> > > > > > > > > > > This is the same mechanism how virtio initialize a virtqueue,
> > > > > > > > > > > working for many years.
> > > > > > > > > > No. when virtio driver initializes it for the first time, there
> > > > > > > > > > is no active traffic
> > > > > > > > > that gets lost.
> > > > > > > > > > This is because the interface is not yet up and not part of the
> > > > > > > > > > network
> > > > > yet.
> > > > > > > > > > The resume must be fast enough, because the remote node is
> > > > > > > > > > sending
> > > > > > > > > packets.
> > > > > > > > > > Hence it is different from driver init time queue enable.
> > > > > > > > > I am not sure any packets arrive before a link announce at the
> > > > > > > > > destination
> > > > > > > side.
> > > > > > > > I think it can.
> > > > > > > > Because there is no notification of member device link down
> > > > > > > > intimation to
> > > > > > > remote side.
> > > > > > > > The L4 and L5 protocols have no knowledge that node which they are
> > > > > > > interacting is behind some layers of switches.
> > > > > > > > So keeping this time low is desired.
> > > > > > > The NIC should broad cast itself first, so that other peers in the
> > > > > > > network know(for example its mac to route it) how to send a message to
> > > it.
> > > > > > > This is necessary, for example VIRTIO_NET_F_GUEST_ANNOUNCE, similar
> > > > > > > mechanism work for in-marketing productions for years.
> > > > > > > 
> > > > > > > This is out of the topic anyway.
> > > > > > > > > > > > > See the virtio common cfg, you will find the max number of
> > > > > > > > > > > > > vqs is there, num_queues.
> > > > > > > > > > > > :)
> > > > > > > > > > > > Sure. those values at high q count affects.
> > > > > > > > > > > the driver need to initialize them anyway.
> > > > > > > > > > That is before the traffic starts from remote end.
> > > > > > > > > see above, that needs a link announce and this is after
> > > > > > > > > re-initialization
> > > > > > > > > > > > > > Device didn’t support LM.
> > > > > > > > > > > > > > Many limitations existed all these years and TC is improving
> > > > > > > > > > > > > > and expanding
> > > > > > > > > > > > > them.
> > > > > > > > > > > > > > So all these years do not matter.
> > > > > > > > > > > > > Not sure what are you talking about, haven't we initialize
> > > > > > > > > > > > > the device and vqs in config space for years?????? What's
> > > > > > > > > > > > > wrong with this
> > > > > > > > > mechanism?
> > > > > > > > > > > > > Are you questioning virito-pci fundamentals???
> > > > > > > > > > > > Don’t point to in-efficient past to establish similar in-efficient future.
> > > > > > > > > > > interesting, you know this is a one-time thing, right?
> > > > > > > > > > > and you are aware of this has been there for years.
> > > > > > > > > > > > > > > > > Like how to set a queue size and enable it?
> > > > > > > > > > > > > > > > Those are meant to be used before DRIVER_OK stage as they
> > > > > > > > > > > > > > > > are init time
> > > > > > > > > > > > > > > registers.
> > > > > > > > > > > > > > > > Not to keep abusing them..
> > > > > > > > > > > > > > > don't you need to set queue_size at the destination side?
> > > > > > > > > > > > > > No.
> > > > > > > > > > > > > > But the src/dst does not matter.
> > > > > > > > > > > > > > Queue_size to be set before DRIVER_OK like rest of the
> > > > > > > > > > > > > > registers, as all
> > > > > > > > > > > > > queues must be created before the driver_ok phase.
> > > > > > > > > > > > > > Queue_reset was last moment exception.
> > > > > > > > > > > > > create a queue? Nvidia specific?
> > > > > > > > > > > > > 
> > > > > > > > > > > > Huh. No.
> > > > > > > > > > > > Do git log and realize what happened with queue_reset.
> > > > > > > > > > > You didn't answer the question, does the spec even has defined
> > > > > > > > > > > "create a
> > > > > > > > > vq"?
> > > > > > > > > > Enabled/created = tomato/tomato when discussing the spec in
> > > > > > > > > > non-normative
> > > > > > > > > email conversation.
> > > > > > > > > > It's irrelevant.
> > > > > > > > > Then lets not debate on this enable a vq or create a vq anymore
> > > > > > > > > > All I am saying is, when we know the limitations of the
> > > > > > > > > > transport and when industry is forwarding to not introduced more
> > > > > > > > > > and more on-die register
> > > > > > > > > for once in lifetime work of device migration, we just use the
> > > > > > > > > optimal command and queue interface that is native to virtio.
> > > > > > > > > PCI config space has its own limitations, and admin vq has its
> > > > > > > > > advantages, but that does not apply to all use cases.
> > > > > > > > > 
> > > > > > > > There was a recent work done emulating the SR-IOV cap and allowing
> > > > > > > > VM to
> > > > > > > enable SR-IOV in [1].
> > > > > > > > This is the option I mentioned few weeks ago.
> > > > > > > > 
> > > > > > > > So with admin commands and admin virtqueues, even nested model
> > > > > > > > will work
> > > > > > > using [1].
> > > > > > > > [1]
> > > > > > > > https://netdevconf.info/0x17/sessions/talk/unleashing-sr-iov-offlo
> > > > > > > > ad
> > > > > > > > -o
> > > > > > > > n-virtual-machines.html
> > > > > > > We should take this into consideration once it is standardized in
> > > > > > > the spec, maybe not now, there can always be many workarounds to
> > > > > > > solve one
> > > > > problem.
> > > > > > Sure, until that point the admin commands are able to suffice the need
> > > well.
> > > > > > And when the spec changes in transport occurs (if needed), current
> > > > > > admin
> > > > > command and admin vq also fits very well that will follow above [1].
> > > > > we have pointed lots of problems for admin vq based live migration
> > > > > proposal, I won't repeat them here
> > > > I don’t see any.
> > > > Nested is already solved using above.
> > > I don't see how, do you mind to work out the patches?
> > Once the base series is completed, nested cases can be addressed.
> > I wont be able to work on the patches for it until we finish for the first level virtualization.
> As you know, nested is supported well in current virtio, so please don't
> break it.

So for nesting, it seems cleaner to support sending commands through
device itself.  You aren't going to fit VQ state in a 16 bit register in
the general case though, and will have to resort to DMA. And if you are
doing that then please just use the admin command format (does not have
to be a VQ) and then we can all make peace finally.

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

