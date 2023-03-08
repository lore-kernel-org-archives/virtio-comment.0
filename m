Return-Path: <virtio-comment-return-4773-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB53C678D5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 11:45:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 32DAA26A50
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 11:44:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2BBD79866F3
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 11:44:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2374D9866ED; Wed,  8 Mar 2023 11:44:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F4899866F0
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Mar 2023 11:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6-tcv7NTPoGbiOQ8EYg0rA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678275890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=et7tDguvXV1KrEosdgLiXvaY/OaxibdX9S/Wa4/sfRc=;
        b=QmQwny4DFz0EVhM8w+aJqgyGMQHrk2shBguJq3UaAa4nzgdapwQ0Ek4bfeSpKau/Bg
         6g9CzWorrEsZo6x44q1sn2Uf6bDnhxGTWa8OfaUoSMPiFcm9YLXyMVOo5GC6ksvfz+F2
         +W1BUd0qZqKrklkX2bZqz0qgA7iYrSWXlzL++RsXFrleFSZHlnPpnPuSkYgCEaFy0lCg
         ZI0M63yCRWgQUeE9R875QpLIMp0nOLTj2E+qxt+Z6HCi07tBlnAWR0PX7PdDTvwK+isP
         0rTjyaPfWru/Wug/PEAcAgk9gbSUXHmjesYKI6JHnYUnlNx5c1Ao3rY63atuS2s7rxac
         +pqw==
X-Gm-Message-State: AO0yUKVhugBv8pwBTCLZ62BWc6TBf74EzKwngykvmFUaeqyiaB5A68SL
	zP7L9hM+d7NPXNo+DqzhhwKbJnlfrMogADUynoPdxZcPnfnjqDnVcUCaV5lkelGm81GLtI038Q4
	KQx2bxOogp6cztjaumNj0JcWvJajQ8sJAgg==
X-Received: by 2002:a50:fc02:0:b0:4af:6e95:6bcb with SMTP id i2-20020a50fc02000000b004af6e956bcbmr15648489edr.41.1678275890777;
        Wed, 08 Mar 2023 03:44:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9SEKI188jxemQ6OJx13TTTZulfpaH9mtLl95yINg7umqY6i2gijdtYQp/9AD0lC2cjtY3vgA==
X-Received: by 2002:a50:fc02:0:b0:4af:6e95:6bcb with SMTP id i2-20020a50fc02000000b004af6e956bcbmr15648462edr.41.1678275890472;
        Wed, 08 Mar 2023 03:44:50 -0800 (PST)
Date: Wed, 8 Mar 2023 06:44:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org, jasowang@redhat.com,
	cohuck@redhat.com, sgarzare@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com,
	virtio@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230308064420-mutt-send-email-mst@kernel.org>
References: <20230303083213-mutt-send-email-mst@kernel.org>
 <20230303202133.GA2901137@fedora>
 <20230305043419-mutt-send-email-mst@kernel.org>
 <20230306000302.GA244754@fedora>
 <20230305191351-mutt-send-email-mst@kernel.org>
 <20230306110340.GA35392@fedora>
 <20230306133525-mutt-send-email-mst@kernel.org>
 <ZAbvxj+7lgaI1HkI@nanopsycho>
 <20230307111143-mutt-send-email-mst@kernel.org>
 <ZAheuCy48ZUObdzQ@nanopsycho>
MIME-Version: 1.0
In-Reply-To: <ZAheuCy48ZUObdzQ@nanopsycho>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio] Re: [PATCH v10 04/10] admin:
 introduce virtio admin virtqueues

On Wed, Mar 08, 2023 at 11:08:56AM +0100, Jiri Pirko wrote:
> Tue, Mar 07, 2023 at 05:13:01PM CET, mst@redhat.com wrote:
> >On Tue, Mar 07, 2023 at 09:03:18AM +0100, Jiri Pirko wrote:
> >> I sense there is no concete idea about what the "admin virtqueue" should
> >> serve for exactly.
> >
> >Because the virtqueue is just a virtqueue - a way to pass around
> >commands.  Admin commands are used whenever one needs to talk to one
> >device about another one.
> 
> Yeah, I got that now. Please check my other reply in this thread
> suggesting a name change of "admin". Perhaps it would make sense and
> makes thing a bit clearer for slower people like myself :)

Yes I think it's a good idea. Replied there too.

> 
> >-- 
> >MST
> >
> >
> >This publicly archived list offers a means to provide input to the
> >OASIS Virtual I/O Device (VIRTIO) TC.
> >
> >In order to verify user consent to the Feedback License terms and
> >to minimize spam in the list archive, subscription is required
> >before posting.
> >
> >Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >List help: virtio-comment-help@lists.oasis-open.org
> >List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> >List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> >Committee: https://www.oasis-open.org/committees/virtio/
> >Join OASIS: https://www.oasis-open.org/join/
> >


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

