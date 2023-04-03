Return-Path: <virtio-comment-return-5169-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70670C76196
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:31:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CADA22B01A
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:31:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B4BF09863EF
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:31:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AC4099863DE; Mon,  3 Apr 2023 17:31:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9B9829863DF
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 17:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ZTY_1aFjOKCBLgUXnjRh4Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680543098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYNdE1bp0wMahUWDGuWMpmhebl+7W/n5ojibxHT40NI=;
        b=L2I1HQf1S8TvUc3FVAWLAt7bjhJFpEjNcmn8Dp/gILwVyT6Ag0Mw3MAeBm6x0R6o/i
         8sT1KX0OBG0T/T9v7qVUvNQeMh8HozQg7OQ3BsSV0p8LELIL2MXr3pbiMpeuAIYGZE1c
         3NsH6MDlZxGegh5OsXroVjhpRBk281EJsesTnjTrLcq70323SXsBI2Qeujs25BQPfSBI
         98NYqrtLa1O0R3m4bKwrd1FhpfM4UUOq9VBV/pHZGA4kDwrbNsSkji6Irhil/VP4cN6D
         F3vN/00VuINAWk65Ps2xzqd6Kqid62WcJgPuu26v37O6Un9PtE/s0HUSiOVxMGl8REf+
         QOow==
X-Gm-Message-State: AAQBX9f7+EMirbbMR9uucWIEvTgI08oaSBzzaHxQFin3G112EKrfghcW
	8kEOTkW5shJ5Ifp7kz7UsrdC8mItqcZSK2GGQWb+baFPMCuZlymzIstmDhH+ikkWtFZSBBuc3BQ
	3ij2Odj2ZsLDERHNRwePeZJadhtG1Imm1lg==
X-Received: by 2002:a17:906:85c2:b0:88d:ba89:1837 with SMTP id i2-20020a17090685c200b0088dba891837mr18129989ejy.8.1680543098628;
        Mon, 03 Apr 2023 10:31:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZDGrzgX+eyzhPqXjz4yGPIisLmIIQXXTykuMh7J+8izNpXaXLVTX0TBfe0+b3hGrgn+XGxXA==
X-Received: by 2002:a17:906:85c2:b0:88d:ba89:1837 with SMTP id i2-20020a17090685c200b0088dba891837mr18129965ejy.8.1680543098330;
        Mon, 03 Apr 2023 10:31:38 -0700 (PDT)
Date: Mon, 3 Apr 2023 13:31:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, sgarzare@redhat.com, stefanha@redhat.com,
	nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com,
	virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230403133022-mutt-send-email-mst@kernel.org>
References: <cover.1680533760.git.mst@redhat.com>
 <87pm8kly33.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87pm8kly33.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v11 00/10] Introduce device group and device management

On Mon, Apr 03, 2023 at 06:39:12PM +0200, Cornelia Huck wrote:
> On Mon, Apr 03 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > Change log:
> >
> > since v10:
> > 	addressed lots of comments by Jiri, Stefan. Cornelia, Lngshan, Parav, Max
> > 	Cornelia, do you want to pick up 10/10 separately?
> 
> I'm not sure that makes sense -- if we refactor to introduce a patch
> that deals with all of the currently unimplemented features (and respin
> this series with the patch that lists the admin vq as unsupported on
> top) we could do that, but I don't think it's worth the effort.

My concern is that people are already kind of familiar with the
patchset, reshuffling for no end result will cause everyone to re-read.

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

