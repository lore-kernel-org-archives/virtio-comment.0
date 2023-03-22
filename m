Return-Path: <virtio-comment-return-4976-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB78C6FD1F
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 16:46:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0256C676E2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 16:46:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E72D6986462
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 16:46:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DF7E298644E; Wed, 22 Mar 2023 16:46:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CECC7986451
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Mar 2023 16:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: s3CAUcEdM5GP1SLalhbyfA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679503612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWCbQtqSiUGMXZ7J6zmGx0AlzMrYOlvHyCrfsZdW9P0=;
        b=6Pu3dd8A0E9jG7j9dUj4Oi5ViRw6bGeWawfBudY/fO/rstXfdgbINbvUiTjB86N2wf
         341vpCNeVVT83BH40cDKLjvqwC9DHi4emq+49XKTw9L1kkAjZymE0UKGTLjxdEtxMz5B
         0n+Nx4CHOjE82p+GKyY18KHNVONpaGlIA5MqHjx7wI2diBaHP7dQzx+KarC6Gu3lBAcT
         wgXmKDwb3dRhjtdG9v19ZidS8Zv7W5jThGqkNjyNLVe1mrPEtbCCHB2YMgwvlpHpSJij
         CoIL1o5GV8vpRH5x2bhIqw9OwpTKDUlXMS7Kv4N8bFKgVTW0UldskstJaHo8eg9ACcmw
         BgVQ==
X-Gm-Message-State: AO0yUKXH63biAKTNdGq+q5gOMuH7w2rPJf6gvzVJoxJY74R9j/rgbR8h
	AOABRtTSfP6p/r0kzoamSDVrRYLvMYCInQBXDOWr5qCzjQZc2Jk4wEDjwJ+Jtn+49pZay40/5S1
	FU+eXuShWMj6dBDyC9RN6X70n3cRSeL1y2Q==
X-Received: by 2002:a05:6402:44f:b0:500:4062:99f7 with SMTP id p15-20020a056402044f00b00500406299f7mr7895963edw.32.1679503612507;
        Wed, 22 Mar 2023 09:46:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set/8aeSC70GE5Km1+98GN4Hm30q7v1mWXkIKNtxMCNrqTI+Z2bgKHAJFCTX3omcOxa5caF2oeQ==
X-Received: by 2002:a05:6402:44f:b0:500:4062:99f7 with SMTP id p15-20020a056402044f00b00500406299f7mr7895943edw.32.1679503612278;
        Wed, 22 Mar 2023 09:46:52 -0700 (PDT)
Date: Wed, 22 Mar 2023 12:46:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	David Edmondson <david.edmondson@oracle.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230322124508-mutt-send-email-mst@kernel.org>
References: <20230322125153.128385-1-hengqi@linux.alibaba.com>
 <87sfdwhkxq.fsf@redhat.com>
 <PH0PR12MB5481FCF22C47F2D23E6638E2DC869@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87pm90hhew.fsf@redhat.com>
 <PH0PR12MB5481C1E2C473B2F13D1B8D84DC869@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87jzz8hh1w.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87jzz8hh1w.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v13] virtio-net: support the
 virtqueue coalescing moderation

On Wed, Mar 22, 2023 at 05:44:27PM +0100, Cornelia Huck wrote:
> On Wed, Mar 22 2023, Parav Pandit <parav@nvidia.com> wrote:
> 
> >> From: Cornelia Huck <cohuck@redhat.com>
> >> Sent: Wednesday, March 22, 2023 12:37 PM
> >> 
> >> On Wed, Mar 22 2023, Parav Pandit <parav@nvidia.com> wrote:
> >> 
> >> >> From: Cornelia Huck <cohuck@redhat.com>
> >> >> Sent: Wednesday, March 22, 2023 11:21 AM
> >> >>
> >> >> On Wed, Mar 22 2023, Heng Qi <hengqi@linux.alibaba.com> wrote:
> >> >>
> >> >> > +The driver MUST NOT set \field{vqn} to any value other than an
> >> >> > +enabled
> >> >> transmit or receive virtqueue number.
> >> >>
> >> > Why do you suggest a negative statement here?
> >> > How is it better than,
> >> > The driver MUST set ...
> >> 
> >> So make it
> >> 
> >> "The driver MUST set \field{vqn} to the virtqueue number of an enabled
> >> transmit or receive virtqueue." ?
> >> 
> > Looks good.
> >
> >> > The device will anyway have to check and apply the parameter to the right
> >> virtqueue.
> >> > And if the vq is not enabled or vq is not tx or rx vq, it needs to fail the
> >> command.
> >> 
> >> Well, I think we want to avoid having to add a normative statement for the
> >> device, so we need to be strict with what the driver is allowed to do.
> > Drivers are untrusted entities.
> > device normative statement is needed, it will do the checks anyway where it is applying the config.
> 
> But isn't that implementation specific? I.e. if the driver sends junk,
> the device needs to be able to deal with it in any case.

I agree with Cornelia here. Yes if devices do not want to trust drivers
then they will validate input but what exactly happens then is
currently up to device.
If we want to try and specify devices in all cases of out of spec
input that's a big project, certainly doable but I would rather
not connect it to this, rather boutique, feature.


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

