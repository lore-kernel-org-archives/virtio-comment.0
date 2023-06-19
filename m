Return-Path: <virtio-comment-return-6398-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E17EB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:33:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 13CB387CA8
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:33:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E1D779863E1
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 17:33:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CE2E19863A9; Mon, 19 Jun 2023 17:33:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B9CB79863B0
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 17:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: LcwrJu8nNOKre-Fy4imalw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687195991; x=1689787991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8skxta9Z5M93F23t1nFncrCwPJc3ehSV0rJ+zuHUCUE=;
        b=hzLG7PpllBlVsAg1SHQ05nakGLDQrfu9soOgam1Gq1QpZtWvogrIRg07XQFfshIQ2J
         4tXD/ZAUvbsAJxmgd5Q8M9FWJFIidPW/3lyPmDpO4C9efjGqIW6mbiQMvd0cPY7nlBHl
         CBKCHF1/QpiMrc5ue4RQF5EMeTjMHqPHef54ye6i9v8fVn7Kam6B1TERR2ii8gL0GsSG
         b+ON8bkoxQHlnQfTY16oMWjWbmR06kLmky0w0wRf69CIjAiNeFkPw59Bcx3Px2N2orQm
         YmrNmqI+Ugr6SGrouMBFNZlf5LSSfmNU6/rxzRwmLkA3ysCxpyiqDPndUxoURUfgVn5r
         6SNw==
X-Gm-Message-State: AC+VfDwbfMaJ/eLxgla/VDhzmlxN5/kJNdUnzHBo2RmCm9as6bfzSifw
	/Js7h7iLwtRFpVi5cIy4aoqdhkF60o0LzLcZcmKwx1AqpPHMH1MGQUJeSq30pCb6QHVeG7d5VAG
	uRm/FD6JaldH8x+g6YDEn4YdIT2ryqYF6kA==
X-Received: by 2002:a7b:c454:0:b0:3f7:5e08:7a04 with SMTP id l20-20020a7bc454000000b003f75e087a04mr8597876wmi.25.1687195991359;
        Mon, 19 Jun 2023 10:33:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6C4sK3P1Y7P+PK6JOKEuGNY+XRSjHuptIXsDAKhITATz3tZJFZ7FXVEf4RiqJSjtawYpgz3Q==
X-Received: by 2002:a7b:c454:0:b0:3f7:5e08:7a04 with SMTP id l20-20020a7bc454000000b003f75e087a04mr8597857wmi.25.1687195990992;
        Mon, 19 Jun 2023 10:33:10 -0700 (PDT)
Date: Mon, 19 Jun 2023 13:33:07 -0400
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
Message-ID: <20230619132640-mutt-send-email-mst@kernel.org>
References: <20230613173015.1244486-1-parav@nvidia.com>
 <20230613173015.1244486-4-parav@nvidia.com>
 <20230619121724-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EE01C25B4C170E498177DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230619123757-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54816B14CE2DA659837D1C09DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230619130440-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AE9F8C823289DD17C7B2DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481AE9F8C823289DD17C7B2DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v6 3/4] admin: Add group member legacy
 register access commands

On Mon, Jun 19, 2023 at 05:21:20PM +0000, Parav Pandit wrote:
> 
> 
> > From: virtio-dev@lists.oasis-open.org <virtio-dev@lists.oasis-open.org> On
> > Behalf Of Michael S. Tsirkin
> > Sent: Monday, June 19, 2023 1:11 PM
> 
> > > The "legacy interface of member device" is a vague term. As implementer,
> > reader I don't understand what that means.
> > > The commands clearly communicate the scope.
> > 
> > Add this as an example then.
> >
> I don't know what this means. 
> The section speaks for itself.
> We currently have,
> 
> Section 2.12.1 as "Group administration commands".
> Under this I added,
> 2.12.1.1 -> Legacy interface: legacy configuration access commands"
> 
> Above is no different than 
> "3.1.2 Legacy Interface: Device Initialization"
> 
> Tomorrow,
> 2.12.1.2 -> features config commands
> 2.12.1.3 -> 
>  
> > > > If you want to also have a type specific text, be my guest
> > > > "specifically, for an SRIOV type" ....
> > > >
> > > SRIOV in generic section doesn't make sense. It is covered in the pci transport
> > section.
> > 
> > When it's convenient to you you argue that it's clearer, when it's not you want it
> > generic.  Just mention it quickly and link to the specific text in the new section.
> >
> If you reviewer makes point "it is suggestion".
> If patch proposer makes a point its "argue" is not good way to discuss.
> So can you please avoid quoting "arguing".

To argue
	verb: give reasons or cite evidence in support of an idea,
	action, or theory, typically with the aim of persuading others to share
	one's view.

> 
> It is not my convenience.
> In the spec transport specific parts are not added.
> Hence, I said SR-IOV in generic to be avoided. It is better kept in the pci transport section.
> 
> > If you are intent on
> > spreading this all over the spec we'll need to rethink the whole approach.
> > 
> Where is this spread all over?
> In v5 it was self contained mainly in pci transport section.
> You asked to split to generic and pci.
> Fine, I split to two.

OK I see, I guess I wasn't clear. I was talking about as much as possible
using terms "owner" "member" "commands" "member_id" and so on,
such that the commands apply as generally as possible.
From that POV this needs a bit more work I think we can make more
things generic.

But I am looking for a way to keep this stuff as self contained
as possible. I don't much care whether the new tex is
under pci and admin command section just lists commands and links there,
or it is under admin and then pci section links there.

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

