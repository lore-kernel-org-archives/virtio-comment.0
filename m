Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799245;
	b=T4umqtQ7x0oQfG8fmxVYKDGJXgaJwRKIotzDo3Mx7xoTTFubNAQDx44Ol2PMHmJ/Ild9
	 PMXKg9P+lwd4Bu7j0tcfzF24L5FWbyV+PTqzOPFiDnxYeuwJsqdT6lzvHneVBkxQAS2GZ
	 QwtERU7VQ73M/C6cECebRnp/OPx6OXocQCwfADa0/OL9B/SFBC1GkWukzcvwdRQM//naF
	 iBN2t/cZ47TCB01kg70ciy2qSxdGnoZ7KHC2JupmHZoHSSU9uC19OdMsdSQpeMpHdDrZE
	 /cUVEScEuxYq2bTXp+tKyGaOZ+UWabKduI/Ikq7ZalAJs+5vPuDH2vFCRXavoTgIuvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799245;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=s32Wl9DzzuI95TP9WP70xCrjOTbxlc+l34wwZ68xTWQ=;
	b=xgJ6xNc9OLkmEGmg7AibwoRfeBOXYhGAOHIl0nnEiT9ceH+U/RNHjt/2ECDfYz7jAcwY
	 69iekN7w+LDOnZhaDpwefJHNwP+KYMcZBomA2e4vw+QnoQRN9iR5geL/LW0y/CCEC/SgL
	 XblGbd/2ehtuVNaDBmT5BrklLILh0+OK6R2SP+xXxT6PquW+NePZAAMSXI/e3SbbZ+58D
	 8AzYtv+V2jKPtxIcVkg1qBr3kI+maqQFu0A93es8428+DjqENhVTIxJFnZDNg/bx7IYEH
	 Rmkyc7fQ4xSdaYo6DrkTvkMBwr4uXgeirLFTwf5L3vbFQVXsa08Z/I5+rUvbqSwvuPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B5xiy2Ps;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5227A606A31A
	for <virtio-comment@lists.linux.dev>; Fri, 23 Oct 2026 23:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5227A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B5xiy2Ps
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792799244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s32Wl9DzzuI95TP9WP70xCrjOTbxlc+l34wwZ68xTWQ=;
	b=B5xiy2Psl+r+cUtlcuFpyQaLeRpJmDCs+0sGQMP+F03wZGQfS8+OxFXeJBOrVOJRgvjTQZ
	0O9DqINTQ9voq0Tg4HACpnYZyHcraIuTJK68tD7xIn/T3vnuoC8Ou3swwn+bzCJ9cGI6J0
	Lvkv8MjNVNPF0fH4Irp/EhRPrhkTaR4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-e9g4nLjDMIu2ikfEytfDlg-1; Fri, 23 Oct 2026 19:47:22 -0400
X-MC-Unique: e9g4nLjDMIu2ikfEytfDlg-1
X-Mimecast-MFC-AGG-ID: e9g4nLjDMIu2ikfEytfDlg_1792799242
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48dfa054f26so1077763f8f.2
        for <virtio-comment@lists.linux.dev>; Fri, 23 Oct 2026 16:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799242; x=1793404042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s32Wl9DzzuI95TP9WP70xCrjOTbxlc+l34wwZ68xTWQ=;
        b=JZCyPcd+eFdrotdJ6EzqBKU1koLUswchlBqvK03IoMK2PaQBqRi1RUtZK2Plme5TU5
         60f7Ojl11TIAvioACERS6qR0JSglcBHIViA6Z2txujMQ2ArUmEMSDTIEnU1QPOSE/AR5
         3okCTBNN6UThVxBQ9fb2aZrjPxj/vcuKFgBJP7NNMUi5VlQN+bQ8p2l6nf2lNlqWa2P/
         yJTU2lINGvkM4Ttsl00s+e2sAu/6fBiuUB2KdMtOv9Osxo8XAUS1ibxFn6ugAVs4Tbb2
         ZOEUbcRF5hdthSRRDjV8vAyVF2BK7Q1QX5vbnR5RGwJsuH0JWBCMl97JgmcW4cpX4059
         KFvA==
X-Forwarded-Encrypted: i=1; AKwUvBxQycDYmyQWjHbufzw5TDauGuhjBiJrimVQYtLK+nVOneYWa+jEy/U2IE7+IZJY7nrA157CFsmD8xRjePKH7Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJYm+6W/QtU1n9Zop5PC/WzP7ePc3C3nMw4JpDHko5oXWk6pjSJ
	mE3KcWQEwwEFJSWJ6+MjHx8aV7gP/i+DeTd+uEyICqxRBMemROevmbkRX8YWSRRtEJma3HYWpkc
	9Yiwp/JJlcizTfH4z78MWh52j2yCuetDMJ10OGsj12Yw8sjNixNbmKWnpGaM0/0zui7Xd
X-Gm-Gg: AYBFou0fhScJugwetnkytSut2nTC3HR57XcpJOPd08g5YqAgaKGmAuU8f7Apcjn6vvW
	EvXYb9hNQ3sdaJsu0a+kKI4Wk71C6WsuoY4DcGNJkaOeIqFoidTxhTOSSx2be1SoqyYhmQJjaFM
	qykMpaqwI3jOVEhfzqGlzWKRaloatDiX2asGi7ZiU2ebSrnvbLtGJRrRdykTAUszu4B0WlfmrgK
	cRrZ0wwTtAavEY/oXGqz/NNFQgFLEjZzPMwjboyJBVRJBZPydqNSG5WIJxf0/9kyzikjY8Lih3Q
	kJD5VW74MdT3KRFAvVM5udN1mB/VFZ19SI5p1NQmNsofRgKyXscXVuU4I2wSnnDlf2ysyro=
X-Received: by 2002:a05:6000:2a08:b0:48e:3bc4:a367 with SMTP id ffacd0b85a97d-48e3eb8c374mr401643f8f.33.1792799241587;
        Fri, 23 Oct 2026 16:47:21 -0700 (PDT)
X-Received: by 2002:a05:6000:2a08:b0:48e:3bc4:a367 with SMTP id ffacd0b85a97d-48e3eb8c374mr401634f8f.33.1792799241127;
        Fri, 23 Oct 2026 16:47:21 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm1058622f8f.11.2026.10.23.16.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:47:20 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:47:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261023194646-mutt-send-email-mst@kernel.org>
References: <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
 <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RIW-yOvC9n-X_uNdqisrw8tNsUM6U3rfI7Kf9ny4L0o_1792799242
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 23, 2026 at 10:56:24PM +0200, Peter Hilber wrote:
> - relieve Virtio TC from some device ID registration work.

At the cost of easing pressure on vendors to specify their
devices.

-- 
MST

