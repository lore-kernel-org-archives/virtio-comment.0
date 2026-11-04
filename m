Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803619;
	b=p8vKO9reWwe3fhMAFar94u3Tvdro4ymUsSdSdO8fG4X3QOjz62TuyhSObH9I7dK6oxmd
	 bd4umFejU/SHqBEaNlI71s0ZNoOqNPx1GrCHT3ozYizShFZveWV5KQ7pXPWt3a86Vg3eF
	 d6kCGmfulW37XBUlA3WYizQPzH/xexTsm1NBCBgOhPv02zle8UXF72/dHcQ3Yv7qMRhnK
	 BZ9gbLEHhN1o58lNlV93aW5uKglamKI5zEBxGDIIWjhPgml/wcSywLkPwaIyANWHTE835
	 caHBP5yQBk79VcmrQmnzoFbkWYC76+AAL3Gko9sN/WGvgzJxQthwlfhOWTiH3DUHLRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803619;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=ztMWNYulb1MNOGrl1O5kD6FvcPLySgcKliyMEEXZqb0=;
	b=WY0QIiqnE0juB8llD1MoujxfPKuG4LOLoMCikuCnSCgMC92DinUcvaH+7qcG9DqHrT/s
	 3pS0pA2Oe+qF+wbwiuMt6YnGgnYmwtWdxocS6pxdkw/0VzUBBEGdorrN6bgTgmqFvaDNs
	 aQ9UtXb+D4qbIbe+uMKAmTp66c8YAehJHmcf9EmIIeqFCEuYZ1uA+fpbgirglgK152LiE
	 UkleDw6DIZgj5HuZuzjmI3HjAPu/RaEp4u6gtbk6hoAX8fiWTEjt+BgBBAy2So8bg5078
	 zuDMzNxNrTic1JjchUmEztWKvb908BHsuVnACw1m4/Pdl5Zn7iJT10DJa7ICmCyYN4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KeDIjNfA;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF85606A31B
	for <virtio-comment@lists.linux.dev>; Wed,  4 Nov 2026 14:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF85606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KeDIjNfA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793803617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ztMWNYulb1MNOGrl1O5kD6FvcPLySgcKliyMEEXZqb0=;
	b=KeDIjNfApieej9F7CR2KKJbJY3JsgWUAuG5XzwBPZ3WMTCfcz83AHWgvW6Zjs62hziagYr
	bU/ejjbEuZbgWgfEdHdjag6Vqh/Anh/oDd5SQm5IOkStBCpwy6TicEKdGVOL8zXFNC8xAs
	AsR/oPPmkcMif2RlNNbdHm6/VlJSh4Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-w0QYj5mnPdmFdAAv3Ip8Rg-1; Wed, 04 Nov 2026 09:46:46 -0500
X-MC-Unique: w0QYj5mnPdmFdAAv3Ip8Rg-1
X-Mimecast-MFC-AGG-ID: w0QYj5mnPdmFdAAv3Ip8Rg_1793803604
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48fc8d1c14bso917592f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 04 Nov 2026 06:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803604; x=1794408404;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztMWNYulb1MNOGrl1O5kD6FvcPLySgcKliyMEEXZqb0=;
        b=UnE3X8cKjgljuj1Z4CyqJeVhCCDmkSoCPOMPiEEzxC2Bwxid0OFakx+B0Wlbd4q6rg
         ohHBiS6+Wb2hcKNdvL+xAt6mS99J/X0ftzdSIUdrhAdkec2g3AOOBj2N1efeyX+PBtxV
         fhRxn5qYTDiqOWmtsi0vL0TwlYh3zWd3Bz2zsD6n95hUAFXjJcKUFZIT0dz+HBHHrimH
         np6dMxHpd0IWW0thRF401eAPWM71aXxKfo6N/BVu1HcAbqLl8kuhsj0myNEyVd1LM6jU
         6xRR+HgaxtIt1ueeBvK9Vf5xq28Aze56237/mhjD0CHYUdpnQMsRY3Y/LyHg09GE2TeE
         oM2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWpJAjY0kCUce/VAfpWXZf2Q9ERZE+2AYRD85UdMHK7ZN42Azc/DF3TUNRnApYrWbEwcFn/FVwNEcGVfxLOg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/SFzGFYmFdbxWCG9AyTopvU/gLoCd6RfE7fd93klVAqjmWIap9
	SF02oc4Kb6JxffT43DtjdPC/2H0cs+960+g/NXAuSzWCaHSl8HCNlaZHxNeNVcrPKcNTaM6nPY0
	1P6fqVV4jsK5QDsjUBDhw703+bQa8GEqFq/V61bI9SEO386GMAtdmpKiM0SWGiEGNO6yL
X-Gm-Gg: AYBFou2nA2lPLz+Cv6iblWUZdE70akeB5XHVccA1InhbcfgtLt/tOBIVG+XMe4qrjFp
	R7IY9CxOo3XGhkKab2ZK5i549pnYWWbOgQkGip8vf5QLNu3oibb0wlpAldgwcVvPbfLEFx+MAZU
	3xJsl9U1iR5Lz3wvKi/KlA1qjYicJgNGD8kgYBkib0FOc7bc+WLPja94sFJJs/UiAehl8YnS1dq
	IQGheOUgOKVqwFQuVkqWuT/iDJ0vaWpM5Dcf2rgt+zWi/1qcz66+O/e2GFIRYQlqNGO2dP5Y+Z1
	QF7KGmnXBvrZ/AF58vb+fqUtkpvMMyKb0a0CTidSu1JcNdUwhGC7d9Kf/eyImq214+Xq9u+G7EG
	ddqcykRxhqLuZ+NRzoMX4CJZa2PcsoGV0xKd/R8EEKQ==
X-Received: by 2002:a05:6000:2488:b0:487:27f9:840 with SMTP id ffacd0b85a97d-48e6e50d953mr35080021f8f.53.1793803603779;
        Wed, 04 Nov 2026 06:46:43 -0800 (PST)
X-Received: by 2002:a05:6000:2488:b0:487:27f9:840 with SMTP id ffacd0b85a97d-48e6e50d953mr35079977f8f.53.1793803603141;
        Wed, 04 Nov 2026 06:46:43 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1506:fd00:9e19:9994:44b1:e6f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552afcsm4295018f8f.41.2026.11.04.06.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:46:42 -0800 (PST)
Date: Wed, 4 Nov 2026 09:46:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matti Moell <matti.moell@oss.qualcomm.com>
Cc: Peter Hilber <peter.hilber@oss.qualcomm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261104094014-mutt-send-email-mst@kernel.org>
References: <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
 <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
 <875wyo3557.fsf@redhat.com>
 <mkmnrjrkzjg6gdh4u3l6lib7ggovl7oiqwki76pkdboue2szdi@lhpg3ik33w7y>
 <4222d5ec-e44f-46a1-8a14-a2f3fb6d84d1@oss.qualcomm.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <4222d5ec-e44f-46a1-8a14-a2f3fb6d84d1@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WaJT7Y09iUF1YMG3O2oDDGIi7Gl_5hhYldYfC5CeSds_1793803604
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 04, 2026 at 03:34:00PM +0100, Matti Moell wrote:
> On 28/10/2026 15:22, Peter Hilber wrote:
> > On Mon, Oct 26, 2026 at 03:31:16PM +0100, Cornelia Huck wrote:
> > > 
> > > ...this would also still somewhat hold (no need to reserve an ID for
> > > everything, but if you're serious, get a vendor-or-purpose prefix.)
> > > I'd still want to encourage everyone creating a serious device to go and
> > > try to standardize it.
> > > 
> > 
> > I am wondering how these namespaces would be managed and used. Would
> > introducing a vendor/purpose prefix require an approval process in the
> > Virtio TC? Would new standardized devices have a "standard" prefix when
> > using ID 52?
> 
> I would suggest something like this
> <PURPOSE>/<UUID>
> 
> Where PURPOSE is just some well known 32 bit number with:
> - 0x..00:          must be ignored (similar to the device IDs)
> - 0x..01:          test and experimentation
> - 0x..02:          Vendor space, any vendor can use it
> - 0x..03 - 0x..FF: Reserved for future use
> 
> Then the UUID can be any completely random within the purpose. Not "4" but a
> meaningfully generated UUIDv4.
> 
> OR alternatively we could create a QPSFI or maybe Qualcomm purpose instead
> of using a generic vendor space, for example 0x..02 could just be used for
> QPSFI. I don't think it makes a huge difference.
> 
> > Could a device UUID transparently transition from testing to
> > vendor/purpose, so that drivers would only match on the UUID? Could the
> > namespaces be seen as a quality gate so that testing-prefix devices may
> > be refused in some circumstances?
> I don't think that should be thing, once something is properly specified it
> can just use a normal device ID.

Ugh. Let's keep it simple. Reserve ID 52 as vendor specific, qualcom
can do what qualcom wants with a qualcom subsystem vendor id,
or just you know, use its own device/vendor ID.

> 
> On another note. We are here because there just aren't enough device IDs
> available

Nope, I don't think we want to go too far to accomodate devices with no
plans to be part of the virtio spec. That's why we are here,
the lack of IDs we'll fix.

> and while looking at this we figured out that the qemu docs[1]
> actually claim that there are 175 device IDs reserved for VIRTIO and not 63
> as written in the spec. Who's wrong here?
> 
> Maybe the solution lies in finding ways to expand the number of available
> IDs.
> 
> Cheers,
> 
> 		Matti
> 
> [1]: https://www.qemu.org/docs/master/specs/pci-ids.html


-- 
MST

