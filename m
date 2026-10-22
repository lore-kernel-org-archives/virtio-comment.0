Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681537;
	b=wommeG0uaSBQVWPwTzwmRQkri6gVKXo8QXXpH6R+CCQD/WuQJJT+5/2VNi8lP7gz7WFY
	 ATSjinwH9Wu3A3sHwKSf6HE9nkFJaaQBwnWEyfz3PveWaaEl/CdYlzOz8UBy8BBUmzqkB
	 TIQsel5gAhfDGLpc9nU9mdvS6frK1Mi9uecQPx/VEY8Koi49RorbCNxIng9AXS+bkUiJL
	 vmEd6zwfiLN2HK2ddBkyLqdRDCCMHlOv5qOK23ZELJ1p6JSqgr8yV67oC87RiSHI6QjyD
	 mI8eWp4B3UpYyJA4DD10VMB4YY8oZ0FCTIsh54gleEN3iG7K2Ea0z7pn62A+mDAzusw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681537;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:User-Agent:Date:Message-ID:
	 MIME-Version:X-Scanned-By:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=75XOFLtu53KMovykmX7bByQgO5LO1lVSCm/tjF/9uog=;
	b=gJQzTVeNAvNPxXBsah21w646v/gzPafB0ER8ovxg6baXFMYwF/E2Ea6Vi8GM+2ivK0dN
	 T6LaB+xHhXdZE0QM9kx94mdAE0cbTqVA7lx8xGVBTeStulAVCt4AV2+nCRVQVB/o0Td//
	 QKLBSOJeDt5y4GeNKJwe1YtEJUb0XpVfNKpoX0S4hPENg66+WnoJaJf1PJdIN/wvmLjEO
	 BkNd+VINzLadydkTQAdMsZZ2b2LwyTVV50hmw2Ogjp/huG2wnkkhCJaub5xvn2cPe3gTa
	 /8jSwHd7g7djhLmeLOPiZMK91QukJsj8+DbL97tJxKgMotWr0V1+5CPmes/rSVeuU3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MjFG7ZZX;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D67606A334
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 15:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D67606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MjFG7ZZX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792681534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=75XOFLtu53KMovykmX7bByQgO5LO1lVSCm/tjF/9uog=;
	b=MjFG7ZZXkT9qhAiwAKs6Z7soVwc+gbxkycx+t1P6mSLw4HiHa6DfZNi6MuDd4eni7If+Y3
	BMeEsQeTayptyQrQoE3rlXx+yctUbLlrsuFflWEmL9iLESsMoE9csevThr00jSHMWYM2V7
	1g/F78s6OiqzNt1iYWEbe5AtzEE70Mk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-ja41Ekv_NhOulix8CF5iDg-1; Thu,
 22 Oct 2026 11:05:32 -0400
X-MC-Unique: ja41Ekv_NhOulix8CF5iDg-1
X-Mimecast-MFC-AGG-ID: ja41Ekv_NhOulix8CF5iDg_1792681531
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BEBE21955BC7;
	Thu, 22 Oct 2026 15:05:30 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24EF4195608C;
	Thu, 22 Oct 2026 15:05:28 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Michael S.
 Tsirkin" <mst@redhat.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Demi Marie Obenour
 <demiobenour@gmail.com>, Peter Hilber <peter.hilber@oss.qualcomm.com>,
 virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Trilok Soni
 <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
In-Reply-To: <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org>
 <87mrs62vzj.fsf@redhat.com>
 <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
 <20261022032118-mutt-send-email-mst@kernel.org>
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
User-Agent: Notmuch/0.40 (https://notmuchmail.org)
Date: Thu, 22 Oct 2026 17:05:24 +0200
Message-ID: <87h5id3he3.fsf@redhat.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b3EosKOQ_1u21cMzOEvsc8D3c2xreGMig06BAZG-1TU_1792681531
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> Let's define some standard way for the vendors to declare that this
> device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or USB id
> block".

Are we able to use the first <n> bytes of config space for that? I guess
that is the only way that can possibly work for any transport.

Then, maybe something like one or two bytes for a vendor id (including
one for "testing purposes" or so), and the rest to be used in a
vendor-specific way.

