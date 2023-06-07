Return-Path: <virtio-comment-return-6196-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37265C7EE2F
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:48:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 805BF169CC9
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:48:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78CC8986646
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:48:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6EEEA98381B; Wed,  7 Jun 2023 02:48:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5CE54986603
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 02:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: W4a1t4OENoetapWglpaqcg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686106087; x=1688698087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvDnSL8ggAksCx+DtjBJQi6QwVzZhVpPa4InZoix41Q=;
        b=Rj4syoL0BMBg+XRYGhM243w1P2whHKe/tTa1jsMoUzP5Cp9uLiDebYAOPlKFEdbmRG
         QbzoYJFpKZgavjN+5RIE737mWvOVcRXJPb5KjbMAbx1q+aB++yb/haT+45YZQZ66Wv01
         1oD7XXV86jlfBnEY5qXDAjsgCHgb44nr3lUtBIUJjRbgH1ldBIijf4ElvFEjPCsK1nqZ
         7oiE8iaivAMFjB5QWDTD1gsF0CqAsoG8DNjqkPVLQlpeSRn90L2z9uvfEUNY1eNt2QEE
         ztnSAHeLkfR1WwwHpe2JSiPF5Job4DfdtFIhV+ikvpCKmrMeMh/ZUL7bWqGaf7DqzjJ4
         LDow==
X-Gm-Message-State: AC+VfDysQrnguuCTivQKGWJHDSAm+4vU1VhZaJwN7J+mUwxDuNlns61T
	enqLvUpQ8XUYGbfedhTzpEnxp3AEFxb/qfHXbaL+RHIr8ULzSE0JdWn5vjgRtJO56wUJMagLOcm
	8B5FlOkfHycvmRROP7aWltQ3KU8ZONMm5SrDG+61nNfaj+7W39w==
X-Received: by 2002:a2e:9b94:0:b0:2b1:a8e9:d491 with SMTP id z20-20020a2e9b94000000b002b1a8e9d491mr1801457lji.40.1686106087784;
        Tue, 06 Jun 2023 19:48:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4FDbw3nFLl+Mt2enMN5yGEEe2eBh4FTrdzhAzmjnYmHL2pOZBQGykX4i8PXsuSIMhjilrgTOQmBVJGVPRsZtA=
X-Received: by 2002:a2e:9b94:0:b0:2b1:a8e9:d491 with SMTP id
 z20-20020a2e9b94000000b002b1a8e9d491mr1801450lji.40.1686106087474; Tue, 06
 Jun 2023 19:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230601220305.587034-1-parav@nvidia.com> <20230601220305.587034-6-parav@nvidia.com>
In-Reply-To: <20230601220305.587034-6-parav@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 7 Jun 2023 10:47:56 +0800
Message-ID: <CACGkMEu9AMZ8_WWxSWYEMBak3LJZVmRJGWHr2jqwEaoQb-U=Ow@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com, 
	virtio@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow steering requirements

On Fri, Jun 2, 2023 at 6:03=E2=80=AFAM Parav Pandit <parav@nvidia.com> wrot=
e:
>
> Add virtio net device requirements for receive flow steering.

While at this, I would go with a well defined RX frame processing
pipeline like a modern NIC instead of adding individual features like:

- filter
- hashing
- queue selection

etc.

Thanks

>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  net-workstream/features-1.4.md | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4=
.md
> index fc36f31..41242b4 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -9,6 +9,7 @@ together is desired while updating the virtio net interfa=
ce.
>  1. Device counters visible to the driver
>  2. Low latency tx and rx virtqueues for PCI transport
>  3. Virtqueue notification coalescing re-arming support
> +4. Receive virtqueue n-tuple steering
>
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -151,3 +152,35 @@ struct vnet_rx_completion {
>     coalescing after processing the packets per VQ. This ensures that whe=
n
>     networking stack decides to poll, no new notifications are generated =
when
>     per VQ notification coalescing is used.
> +
> +## 3.4 Receive virtqueue n-tuple flow steering (RFS)
> +1. The driver should be able to define a receive packet match criteria, =
an
> +   action and a destination for a packet. For example, an ipv4 packet wi=
th a
> +   multicast address to be steered to the receive vq 0. The second examp=
le is
> +   ipv4, tcp packet matching a specified IP address and tcp port tuple t=
o
> +   steered to receive vq 10.
> +2. The match criteria should include exact tuple fields well-defined suc=
h as mac
> +   address, IP addresses, tcp/udp ports, etc.
> +3. The match criteria should also include the field mask.
> +4. The match criteria may optionally also include specific packet data o=
ffset,
> +   length, and matching pattern, which may not be defined in the standar=
d RFC.
> +5. Action includes (a) dropping or (b) forwarding the packet.
> +6. Destination location is a receive virtqueue index or rss context.
> +7. The device should process RFS rules before RSS rules, i.e., when ther=
e is a
> +   miss on the RFS rule RSS rule applies.
> +8. The device should be able to add/remove these rules at a rate of 100K
> +   rules/sec.
> +9. If multiple rules are programmed which has overlapping attributes for=
 a
> +   received packet, the driver to define the location/priority of the ru=
le.
> +10. The driver should be able to query flow steering table entries progr=
ammed in
> +    the device by the flow id.
> +11. The driver should be able to add the entry for attributes (a) match
> +    criteria, (b) action, (c) destination and (d) assign a unique id of =
32 bits.
> +12. The driver should be able to delete the steering rule entry via a un=
ique id.
> +13. The driver should be able to add and delete the steering rules in ou=
t of
> +    order manner without depending on previous commands.
> +14. A group member device should be able to query the attributes of the =
flow
> +    steering that device supports.
> +15. The driver and group owner driver should be able to query supported =
device
> +    limits for the steering entries.
> +
> --
> 2.26.2
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

