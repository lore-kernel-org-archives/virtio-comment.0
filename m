Return-Path: <virtio-comment-return-6444-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CCEEB64D7
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 19:48:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 48D27EEA08
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 19:48:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A33A9865D1
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 19:48:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3131E9865BD; Wed, 21 Jun 2023 19:48:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 204CB9865C1
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Jun 2023 19:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 08Q4N3cVM42d-zao14S8lg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687376877; x=1689968877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAzVWPKoKfHYATqyItRuQJB63Gh1iJT+55kK9xjNTf8=;
        b=XmD2SQVvxh4ZgG2eNl0xhIUCsmB6vAXA5mOjtLyvHHq5h7k9240aCQzlilEZy+2LgO
         77PWj4inbF1LPGvzQDwGBUnZCpSbMjziQTnxm6T/lcke+jNrlPHMD8QTpUWn9CxW1vxB
         K/cCCp+MsxH3+UTVn7th5Fh6+627NBAvjWlMyEzsIVztwSTT3/1S0Qs98stzX7VHuiaj
         Clj2kxg72svcOED5YNH2PvNDibZErWjpQ44uoHcVmZxF3AkEDzcLWLUimvPDtyik48/C
         LMRRo0Y0bu/O7MTS2MZTZP9IJeTHSj3n71Ux4ZfXiBovX+wgLsn1eN4B/P76qzcktrGE
         4cRg==
X-Gm-Message-State: AC+VfDxAg2J7pQPV6UdbGo3QOuu/rwzFPJj4GsgXBv4m7rPGq5OlJHBD
	ESwdrYvDxyTBspSc9OVe5H83AvDV/2QETdHg5Xg9KBYK9wegVLfnX0QKzcj9vlyJTnPfHTuqdzM
	hzQELueSjceqShvtby7nQRwBM2Wh2CjZnsQ==
X-Received: by 2002:a17:907:7ba5:b0:973:fd02:a41f with SMTP id ne37-20020a1709077ba500b00973fd02a41fmr17147326ejc.40.1687376877170;
        Wed, 21 Jun 2023 12:47:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mMUT5k8OZvlgZaEknkSgDMz/TJM0omW83Ujk1MzLgccRPLL5T7lUlGF4v/kUJoeoERoJyQQ==
X-Received: by 2002:a17:907:7ba5:b0:973:fd02:a41f with SMTP id ne37-20020a1709077ba500b00973fd02a41fmr17147308ejc.40.1687376876877;
        Wed, 21 Jun 2023 12:47:56 -0700 (PDT)
Date: Wed, 21 Jun 2023 15:47:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230621154648-mutt-send-email-mst@kernel.org>
References: <20230613173015.1244486-1-parav@nvidia.com>
 <20230613173015.1244486-5-parav@nvidia.com>
 <20230619122836-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481758B8EE080750D6377C0DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230619131115-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D1836A5B9A7B345A20A8DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230619133322-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E624E00FC403C9ECFA03DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230619135750-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818E61FF6F0B15768829AEDC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818E61FF6F0B15768829AEDC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v6 4/4] transport-pci: Introduce
 group legacy group member config region access

On Mon, Jun 19, 2023 at 06:12:11PM +0000, Parav Pandit wrote:
> And yes lets please stop calling the transport vq as well, as it is not going to "transport everything".

Good point, this transport is actually virtio over admin commands.
admin transport for short?

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

