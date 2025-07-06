Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D5B1CF96
	for <virtio-comment@lists.linux.dev>; Sun,  6 Jul 2025 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751805575; cv=none; b=WzY5SZNzdmJojW8H5Hol1+CYHUxitm3lOYZObqF+N+QCo2aK48SjAPD+Xmqm1Kn9urtEMzvOsG1hJdJDfV1hudZzdsY9MBWxm3XMFOmNNaCBbDGWJuup3MwLnhJ5Be6JO8iO7lPi4OfukCSDWRcm4WiVbQTRFHb3HqDMg/yWStc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751805575; c=relaxed/simple;
	bh=7FEA1E8PmDnHksYNxP2pATaZnueU6DWn81L1GT7NNJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Fbyx2tfjha6H1lM4MI+fsXdpGteixnzdGOsJD+PpJVemebQ0ShCYt6AxcagWEn1XAqobr3jn3o7R5Eyg4Tn5n3E88Xc7oxo0D+u7Pm+iNwkRX1hw2Xr1/t1FlHZn9WxmkBF/fYz8DOI1cRhtNSZS/r8RRfR97o1w25lUDruyb5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ME7/6iZ9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ME7/6iZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751805572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9zOnzKxsTcHHUsn6Md3dLv0aD1wBeAH/bm3q+4YdPSU=;
	b=ME7/6iZ9PqggQOrfa9IjRIABQgaCrn1W6+obUKM1rzmO9l6lklSfAWi+bZat7zA0PKhNEA
	gJ8xnPcSa3EZ2VcUWpdGDw+wjMrNzbA2L9PBODsPTqVioATzBJzBHmoWi9+gMObPM/h64i
	4lShLfh7vAR7b62AqEGtT15Z3w8YReo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-NfcDB9rxP26qtSmPi8eBRA-1; Sun, 06 Jul 2025 08:39:31 -0400
X-MC-Unique: NfcDB9rxP26qtSmPi8eBRA-1
X-Mimecast-MFC-AGG-ID: NfcDB9rxP26qtSmPi8eBRA_1751805570
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ade6fd82263so159192466b.1
        for <virtio-comment@lists.linux.dev>; Sun, 06 Jul 2025 05:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751805569; x=1752410369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zOnzKxsTcHHUsn6Md3dLv0aD1wBeAH/bm3q+4YdPSU=;
        b=pg7aKd3oFyVuCmtYrNKEn/2cf1kdc79WKpMeGO1QcvH0nzMRYv8zQ9InKHIN0fp83y
         NpCQUtxZNEVBuLVJLwKtlqjDEnn3d+yypstuVT20p2/qznPKtm7Tzh8OExQ6J5wyTsSs
         sTnVCokWYI10oLSHbU1DmQMf6uGbdAW9xUa0ec6QcpCkXZEf28tNC8m5hsBVL2l5/Wh6
         xcEGOfIsz4Q48VVq7mAacdY1FF9GC66gkNxpsjk0j6NJf9HFSWXj68rLNt7ZZ9vtbZMx
         JMMRZoQ86ZZVxoItvWsCAy85HarvVUfcMBT5O2VMkskDkxrGzGSQOm1cCsnWtnTyqMEw
         H6rA==
X-Forwarded-Encrypted: i=1; AJvYcCUrAdfntRxU8ejJAhXFdpc+IJXldqH1azuaJsyHAp2lt5e2nbTEt84FXG+zJ11PyZX+8ngTZqQ/AJQONC655g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpYTmQy5R5j9BSPC61H204hZdAosimnVSRaBxEOePtDx671ujy
	Z/iTQ2zI1PRrO8k8p3882KlqTilHFXXrp6D4def32HQRIqgV4PtfWoR+ZLXMDqnwrT4hbtV2pO3
	lVuFYhElLBIgeIzVarQhp11vPssDp5snd98YlsNYlOHjRyvzQVUUgBpwGErY46r9EzEsEwyLv1V
	EC
X-Gm-Gg: ASbGncvzXv5T5HHDU6Gq2xjX3vCJtJR7XIXhxWRJA6QqZJ4caY0C/ir3jhrjVvah8eO
	IrF12fcQOG04oNPHcXV+mGbh2t0cevdep9gVt/wo4pBHQP9syYu+JT8FoakS/uHBPh7l04KJqcC
	aygEyKluoR5FRH5rs3F39vPE2e51O6xwnvI+ba4PsfbKnZ33PQamANJhj3jzE3i+8mJuvjLhSxh
	6SWi9mV2G2zO5ru4aAq1DqNtH1Yu21Xd67W5lyscHWedF2Uu2TqEDYlBSlXbmSawlgNlqECZzw9
	Ts9tj3Xgad8=
X-Received: by 2002:a17:907:7fa2:b0:ae3:74be:49ab with SMTP id a640c23a62f3a-ae3fbc32cafmr952543366b.10.1751805569521;
        Sun, 06 Jul 2025 05:39:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnHHnAVb7OsbtHNP3NfL3LpL0wQQs2UftYlQcavZ2eT7wZWn8NmCdLKke4o052LQ7rZ3szIw==
X-Received: by 2002:a17:907:7fa2:b0:ae3:74be:49ab with SMTP id a640c23a62f3a-ae3fbc32cafmr952539566b.10.1751805568951;
        Sun, 06 Jul 2025 05:39:28 -0700 (PDT)
Received: from redhat.com ([31.187.78.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692fbddsm511880766b.62.2025.07.06.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 05:39:28 -0700 (PDT)
Date: Sun, 6 Jul 2025 08:39:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>,
	"Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>,
	"g.white@cablelabs.com" <g.white@cablelabs.com>,
	"vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: Re: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature
Message-ID: <20250706083812-mutt-send-email-mst@kernel.org>
References: <20250623081847.21264-1-chia-yu.chang@nokia-bell-labs.com>
 <PAXPR07MB7984F5C4CFBB42A74690F103A340A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB71958D120A087B79243A79D7DC4CA@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB71958D120A087B79243A79D7DC4CA@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M_h3hsAUEz6nbu6ZrYsxnBj4ebwzxRqm8q6y-f5fDH8_1751805570
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 06, 2025 at 12:23:36PM +0000, Parav Pandit wrote:
> Hi Chia-Yu,
> 
> > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Sent: 02 July 2025 10:10 AM
> > 
> > Hello,
> > 
> > 	Just want to reach out and check is there any comment on our
> > submitted ECN and AccECN patches?
> > 	Thanks.
> >
> The IETF document referred in in draft stage that expires on 10 May 2024 at [1].
> Is there a newer draft which hasn't expired yet, or link to a proposed standard or Internet standard link?
> 
> [1] https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ecn-28


This seems to point at the latest one:
https://datatracker.ietf.org/doc/draft-ietf-tcpm-accurate-ecn/

