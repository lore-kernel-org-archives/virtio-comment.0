Return-Path: <virtio-comment-return-8485-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB8DC61D85
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:23:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 265B32CAF0
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:23:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E28C098688E
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:23:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CA44D98413B; Tue, 21 Nov 2023 04:23:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1A9A98687C
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 04:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: z50UqdndO26GulXp_R3fHg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700540603; x=1701145403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGo5xRcw3teb3rMtwww/d9hUU51qpjYDEivRo6YGLr0=;
        b=kQGMEYzmyV7bh/j9XrlecJzcrcdHeqgQHOxpxsI8J9mSXNdK/ZC8VkUpsA4GYmjTp5
         vawcCJJpz2XjcrObPP2cx2rMBlF0Ye2ViOP9q88olS4K4GL2hUosngn6J+mvLWrBaiiV
         J2XexiatmfbW5kuAI9XsZa/TIqtmvx5I2pH7pZJWE4XV42SbtoBHYbmqa8lSTSz5QxZ1
         zBY0ptMHtwnB8opspLwLR0Ow6Ibm7EvZ5k+udt0FHf1KnpzmXtdvkyga24oROhK+Dx+H
         9+QQ/mupfzaSfSDRFWCrqMaEkjpFuOVccPIuvGIYDiNtBU2WC+W14RbEmGlHdnmLCxTv
         Qd+Q==
X-Gm-Message-State: AOJu0YxqRinno2eqbW3R0MPcPk0kud2Mzpxz77nSwPEn9/JrEYRc8a0S
	PUsAey6WCIbJnZkdiHuVNTXsXFMCA65K7JpsYCGEfU8FwfW2Ht9d72c/D70z/Sc5fmS/rdVD373
	UTmYA2dxjE4X+u76VIeWDac7wafWavuheJJLwTHTj/FJU1/L9NFACaFtEng==
X-Received: by 2002:a05:6512:244:b0:508:1690:d825 with SMTP id b4-20020a056512024400b005081690d825mr5948315lfo.21.1700540603322;
        Mon, 20 Nov 2023 20:23:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECLg1IwgDtR4bRcJzvU5/WJgVNZwRw4JIdV9JaUoKzVI8JkwAxJSzA02LS5rrnHaEu3GhYil3eNsOe06HAhuA=
X-Received: by 2002:a05:6512:244:b0:508:1690:d825 with SMTP id
 b4-20020a056512024400b005081690d825mr5948310lfo.21.1700540603143; Mon, 20 Nov
 2023 20:23:23 -0800 (PST)
MIME-Version: 1.0
References: <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231116004037-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Nov 2023 12:23:07 +0800
Message-ID: <CACGkMEsyV_=mRVCYAgQ4BMGGJL_-Djyj31MWEmym=Ox2Y8dcZg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Thu, Nov 16, 2023 at 1:51=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > We should expose a limit of the device in the proposed WRITE_RECORD_CAP=
_QUERY command, that how much range it can track.
> > So that future provisioning framework can use it.
> >
> > I will cover this in v5 early next week.
>
> I do worry about how this can even work though. If you want a generic
> device you do not get to dictate how much memory VM has.
>
> Aren't we talking bit per page? With 1TByte of memory to track ->
> 256Gbit -> 32Gbit -> 8Gbyte per VF?
>
> And you happily say "we'll address this in the future" while at the same
> time fighting tooth and nail against adding single bit status registers
> because scalability?
>
>
> I have a feeling doing this completely theoretical like this is problemat=
ic.
> Maybe you have it all laid out neatly in your head but I suspect
> not all of TC can picture it clearly enough based just on spec text.
>
> We do sometimes ask for POC implementation in linux / qemu to
> demonstrate how things work before merging code. We skipped this
> for admin things so far but I think it's a good idea to start doing
> it here.

+1

Most virtio features were developed in this way. It's cheap and easy
to find issues in both design and implementation.

Another non virtio example, that is the rocker switch which is
prototyped in Qemu for switchdev.

>
> What makes me pause a bit before saying please do a PoC is
> all the opposition that seems to exist to even using admin
> commands in the 1st place. I think once we finally stop
> arguing about whether to use admin commands at all then
> a PoC will be needed before merging.

Exactly.

Thanks

>


>
> --
> MST
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

