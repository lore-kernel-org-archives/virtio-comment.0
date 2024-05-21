Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2EF524B4
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716292939; cv=fail; b=Dkiq5Jo265B12S8271d69MJ/I3urTbgB2WiS4T5eSd5tT8rswW8XNIP3gU8bYG4VXxJOP/cjLKUDxs5peJ2C2zzze/SY9hIL1j+/jo3TrE+gHc9iVJksNpD/AYHPKI3lo+b/G9Dgw4vhTxutNMhaWageZEzzqIFK7m8IYV/Em+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716292939; c=relaxed/simple;
	bh=dF9F9ghiZUPe53IAjNSslRsIBMYekEWsCUs+h66ZMhA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ezhLNpqoRYHLZcyaziM4rwyBqimO+gBaxqFLbBA0O+cBks1H6PB/dZZPGGxffHSorHnpTTrHk73AweRRDdaeMbC58a6oekyHte4qYJZh6VVvzlaeeOBugw8oKS3aW/eo2YIlEe1QOUxxuejwFUp7I7O2rBhgHp2GKSqnafg/43o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D+0AxKBn; arc=fail smtp.client-ip=40.107.212.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D+0AxKBn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InDpq3PtSqcoezollrFBR4pCgZNleiGB5WArvdh2mdRMIN3vYI3WSbacCajxY2CegEB/cIVrltGFj1+ivJ/8wQJqhl+Wui0Ywrk5AHox6n0CegDNu1aNejLT3HeGLx2gZOFZWdsnZEzeuTNOO+51s4xoBVct7MEBUm+774BuhCuAFeKiS1o+EPM3RyHBfTrtqCTZ7vfoXEwxBvRR99lIFwnsw2KgKjDMQ5SJGqpXTrjnakEzbqVTouz+F+yBdcBSiCd6vbKC53SivI9xz3LeAnuYmOEEPAe14GCmkEa6S3ZFbUjFDs1t0VLTTgTVHcaboddTmkXnSLIkGn0uyxkFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceJ1fJWK/sSJ/ugDYobhn9W7lh7CDFOviVeNkYkrEjo=;
 b=RvnWlG6bwcybS3IgNBbeklcrfhg9VmJmpH+JFIGfKhSrOcaF1c3PUFoT/Uoa9YlANrf/DxjdgpPeV/JPjYCn15Fk5fxXiCDdFWa4bCNRtZbkPzCZqDsa6atdxENYufWHXnognX1ZNYin5FfzyjyjfvKYkYcbMwLn9C3DZ3FCAC9ylsubUzhbtVR5ysdKr5brxaXB/MDz5ozWCLt0oBcQprJDR8riRLlzINmIcMEoptxmberDZdej1Xm72+25X1JPqydFMnNNKMlYDbHE8voPYL7OTRAI79rcF7eC6d3vzgTfbzt3hY+w7UkPy8fCuu4wgzQrycVdx0k+1MrgbX4hPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceJ1fJWK/sSJ/ugDYobhn9W7lh7CDFOviVeNkYkrEjo=;
 b=D+0AxKBnF9CX+iAH99WOpDgerkXTVQFs3um9Va7xYC66fiask8P+cyLXUynZ7CpQeHT+x1vNMuO4iPiR4HQ4+CSiqS7TVUKoSP7IeC5VuoPdbNji9SZDs1bXYUun9Yy82qOb53mcWnp8xk4RbzOEGBceyMA5gHwLBdTnhLvUpctMyTovPeLY7Y36SfBk1CY4j6DwmJ5MValN9M6i1RFML/4kELtKiCzU4gxEzOnVH/GYuR4/dG6heT6dRnR90LSUoLjPCW6+8g7oWrij6BsMRWqb/xpezgco/aQ2ultyS49va7ZKVBG/TjrlyS4eU9qdrQBC34yEpV2mz27sq8vA6Q==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 12:02:13 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 12:02:13 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v3] README.md: update mailing list info
Thread-Topic: [PATCH v3] README.md: update mailing list info
Thread-Index:
 AQHapq3cqOwFBT2zLkCXuuWIgQjcxrGYE1qAgAAFLACAAABCoIAAAYUAgAkETgCAADPxgIAACJQQgAAibQCAABuRsA==
Date: Tue, 21 May 2024 12:02:13 +0000
Message-ID:
 <PH0PR12MB5481394675923A8A4EE3166DDCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515063503-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240521032438-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481168F6B161E51F8251992DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <874jar8p0v.fsf@redhat.com>
In-Reply-To: <874jar8p0v.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8191:EE_
x-ms-office365-filtering-correlation-id: d6c86c1e-7dde-4879-1b19-08dc798dda26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?P6aCSlOguJMPGK2M88VflZYLb0cCXALAxvUZQKOsIMNJmoY4yaQ3cWlRC3W5?=
 =?us-ascii?Q?FvGF/jMfIU2M2Gkgg6nXpiEX7DkatxnFUx1uCjtJWPfugaYJ1DyCh5EAEnc1?=
 =?us-ascii?Q?erBALY61V3jkbq0Azy/9zCFu3jVUqJQkM0LF8RglBBQqiFaWSTnTqeRh+G8Q?=
 =?us-ascii?Q?LmkOIWfLBh4ZD2vnadlGTRsiZldW7RByWJxZ6GKGSJKZVizCspeuAjRi1rwE?=
 =?us-ascii?Q?ok8Rf9iFBQ/1eU9p1+PdsyQF6UBnh43KAQdySjBSYNiinT/bocjxopqo2y5T?=
 =?us-ascii?Q?bXpNasgrniqSDWmJ3FN1Ccd6r5iHFA0BxPR133lIssPdWh92n0Qau6wyR3IP?=
 =?us-ascii?Q?dWvU05v+nwLSypSapE3nEWTdRCTPYVAtnoAHrJfWUMcAz8tvaGg89OWeNWBJ?=
 =?us-ascii?Q?iRHyCYG2k4VSoQZHCi4J5uT363pL+kep9Qcp0tblUv1M55sGQ3xTelf1Bsxv?=
 =?us-ascii?Q?3cKlX+Wi1w0/J+qsjOG7wMMdtwPWgbKcptR78jD+jFN7vdwJT/JEGCVeV4Lo?=
 =?us-ascii?Q?UKUTypFkkfAS/zPzSO6QR+zQ0Gihbe1XE3uK5DOCzDr5Kp/4vIus4qXANXYK?=
 =?us-ascii?Q?VcPtuL5zjp3vKXL29+1SdePiGekUGo1tc8kTru0Sbe4gnat8yRQgm9YQWtPC?=
 =?us-ascii?Q?ZwoekJ77kebcWrJxXsvy7OEsocz/+31knc3NR+R90c14EmIFRyf61WWpVjqp?=
 =?us-ascii?Q?FJtkuoPItK99yMPZSMSvbF0y+FVQdAnkthH/cpJtXtz0pXUiK5d57epOwgH3?=
 =?us-ascii?Q?WE348k6jBsELgoYOh9YesNYj4eeLWZ75va70rvcuF1Hsr2bNAhPfvKUyMpce?=
 =?us-ascii?Q?SKbDGz4oAW6zhRnEIQBqmsQlIcHIep84ggdoGOGgF7oVZiPNTTBf8UqtpRMA?=
 =?us-ascii?Q?BiBWBp6wrAxuVO5MMzoqSCk14YqGnuE5YJHKFVplayDxP7HuVOgUNBBK/m1q?=
 =?us-ascii?Q?F3Lniy07KYzUq4DOvFMOwqS81piNd2Zf6c4u9dTyBkjuPj0rCZJgd7FzEWqp?=
 =?us-ascii?Q?ZbHonZQJfqi9hVZYu1Pqpf/kT0SukzNfGyQI6U0DkKGeMlhiWkzlf8Ox13BK?=
 =?us-ascii?Q?pISWBOFPrMTAy1vJaquCMGXpZhpUrR/JxOtWLDwm7FPJOmqhPg12eDubfoKZ?=
 =?us-ascii?Q?kLkm/JYZUqst3e4N9QuwyVv876Obj2yrsF7Ie9jNy42H9wnimUF+smxtxaJR?=
 =?us-ascii?Q?2fRPZe/ZdwamqUr1M82wEPHvlA8hJRSZuqv6YxPuLg1TeJ3uOhb/k7gbjWET?=
 =?us-ascii?Q?R9rEYYtcsGUAjIk2ZzKM2jS5XALLgCyXULToIUZw0w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dZGUDVcVcJbcIGhWzmmYRENoZER1ZmOTDBUfmMWYFnjX/JdNWbTcYfekcQJw?=
 =?us-ascii?Q?W0UgghZyyGlIg2xBztnwYfBcNPYlz3UJi/2HyxiVUL0ZyuqsTZ0990zLfLbB?=
 =?us-ascii?Q?VCaN3e1lLUpSSDpJy1G2sVr/84yBGi+Ng6glTGrLe1302J5TZlO1Mf8BACTZ?=
 =?us-ascii?Q?MzmDnwdJjIwmakMfCklx9gKi7zK3k+o6acNcGhBo4Vhf6CbrrgQPs4ZSbDla?=
 =?us-ascii?Q?r9Wt0UCtNCLX6Xsn9Ulj+6CT19KsE0IgXr3hgRLyds3/TKl9AuCRh1cizsvz?=
 =?us-ascii?Q?cX9aLVwYbezasE0IyfZi1bc5W4jqBifTs214a7/GJMlgs++2bVZhuEyGr3UT?=
 =?us-ascii?Q?DUbaKuU3JfsNmRyDODHjK0DkIYgA4mfCIvjCg2JG543pLttKlgPF7LhlYMYK?=
 =?us-ascii?Q?XhQw7F9cQA5klPTHAQBO1Ih1jO96+KxUZNnpKvqcL5g2m47wbQmdWC/JOj12?=
 =?us-ascii?Q?U/4wg93F7yeHmeUdjrTNTByhUEtrs7+d/EXTLaKtxEGO6+HIHunoj5/G8fkO?=
 =?us-ascii?Q?UtPwVlWnB+E9pO8a1u1Eh+uuy1H97MVIDG1lZPwwzY+UXkgNNHijbCCCvT0X?=
 =?us-ascii?Q?N2GG6uX5ZLXZKsXnLOCQBtlO982mPVlmElwNl/lyluiZSaHUa2v/YbeAuM3m?=
 =?us-ascii?Q?LIiZaMgVtZMM851yHvqWhNCCd1uTHNni0rwDqBW0H4EvGXMza88ZGjBEFy/Y?=
 =?us-ascii?Q?cWLejQvWtkh6IxZEXcWZwPoiLQGgpn0aDuOOK3HoYtC+fbSHoxdIn2QZmDyr?=
 =?us-ascii?Q?9QuziFmPU0BKji2MT+DwtqxblOC7f0COpsAPkq7oW/fpIHbDvJODLBjU0Mwn?=
 =?us-ascii?Q?5ij64swllIINrj2P+zjszBBkh/vhHiqtsKiftu/wPah3uT0z4ay9GUCRj9MQ?=
 =?us-ascii?Q?R2Hy4FnvS+DO2gLIezHd2a+TZdzuGheeGNW96rQPoWSGwmzRvd6eCQ3LAf7/?=
 =?us-ascii?Q?/dZEmYyoN8YN+bGAXO+29guwDK5NEWSMcM2v4NXemwgHiL39Vm5YZABgzl2X?=
 =?us-ascii?Q?a5BkTIxeyFxhJB1w4cM7V56UEBdg0YOZpzPydJG5QaFAprm19AlGO6lgZjpJ?=
 =?us-ascii?Q?7Y95pkfhytsWVXKfO+Z1Ds3FY5f8unRpGyE7Dy87v9Tzcu8OspOBxqdpO6ui?=
 =?us-ascii?Q?4ErijcxagrnwfQIOSqyOBazvZNjWM7W1liBiA8ZnOFAWZZmIbT0F1CjmiI/H?=
 =?us-ascii?Q?LxLj35t+yYvr2LIlGp31QoD6PBT3ERitP2DEk72RGASeDvN7Xbi54WP5vcyY?=
 =?us-ascii?Q?7TSkX3lbiYSC1p+nAvUFWW0xPIgvVcF7IeRTLvHuY3MYGql30Zgd2KRfObYa?=
 =?us-ascii?Q?j4rLlL6uUnagJRudXtoArgwfOdjZibPibumQL3DdRMc9wNETsWzfe/b317NG?=
 =?us-ascii?Q?qrqbOaQBSq4ltPEVgnFp73RD/Tha+u+YTo/Pva3gdo7LthketQ7e4R8PU7J8?=
 =?us-ascii?Q?SR3nmEVTMj4KCnQZQEnMKVoqkGGybtFP9VX5MGGPiy2yhCSeXEd/D0rUKnCz?=
 =?us-ascii?Q?TZwajMscmBxssEkeRE3Mp6ago6urb4q7Rm/B7QyZFCC53GT9xtghWwiFCAy4?=
 =?us-ascii?Q?l3lOpMexKVhYLAOKafY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c86c1e-7dde-4879-1b19-08dc798dda26
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 12:02:13.6980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pum9e8gyqR/Z1n9as9cRxKlP6dZKqrN1BEGTAL1QwyjRH5e37DV3XWAMO5PEQMrP6/vwU3toL34d205TSWyUxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Tuesday, May 21, 2024 3:29 PM
>=20
> On Tue, May 21 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> >> From: Michael S. Tsirkin <mst@redhat.com>
> >> Sent: Tuesday, May 21, 2024 12:55 PM
> >>
> >> On Tue, May 21, 2024 at 04:19:31AM +0000, Parav Pandit wrote:
> >> > Hi Michael,
> >> >
> >> > > From: Michael S. Tsirkin <mst@redhat.com>
> >> > > Sent: Wednesday, May 15, 2024 4:07 PM
> >> >
> >> > > > > I would wait until next Monday at least. Give everyone time
> >> > > > > to subscribe to the new list.
> >> >
> >> > Can you please merge this patch?
> >>
> >> Pushed now.
> >
> > Thanks Michael.
> > Cornelia mentioned in [1] that master and 1.4 should be merged.
> > 1.4 is 17 patches behind the master including this one.
> > And 12 commits behind..
> >
> > Can you please merge them? Without it, there are conflicts in patches.
> >
> > Also, we need to update in the README.md on which branch to use for
> sending the patches.
> >
> > [1]
> > https://lists.oasis-open.org/archives/virtio-comment/202401/msg00087.h
> > tml
>=20
> Repo status is a mess, because the state of the TC is currently a mess...
>=20
> * Before we can merge the branches, we need to do a proper Special
>   Majority Vote to release 1.3 (which had been delayed since *last year*
>   due to first the threatening migration, and then the actual
>   troublesome migration.)
> * The platform is still not working properly. For starters, we now know
>   that other people besides myself are not getting any mail from the
>   main TC list;=20
Can you please follow up with OASIS?

> given that the ballot approving use of the new lists has
>   not gotten a vote from several usually reliable voters, I fear that
>   mail delivery regarding ballots is broken for some people as well...
>=20
I have followed up with OASIS for several of the members to fix their votin=
g and other broken access rights.
Are you following up for the rest, or should I? Please let me know.

To my knowledge, voting is broken for Enrico Granata based on the ballot #0=
3820 and previous ballot #184, #189 etc.
Which other reliable voters are we missing?

> Before requesting a Special Majority Vote, IMNSHO we need to be sure that
> voters actually get notified about it. [We have raised the issues with ma=
il
> delivery with OASIS staff, but I'm really unsure about the current status=
.]
>=20
Can you please check the current status with OASIS?
The migration by them is completed in March more than 2 months ago.

> virtio-comment subscribers who are TC members as well: if you didn't get =
any
> emails from either the main TC mailing list (you can check the
> archives) or from the voting platform, we'd like to hear about it.

Contributors are not blocked anymore as the reviews have started already wi=
th new list, which is good.
Your previous recommendation of using the branch 1.4 for all the spec patch=
es, likely still stays the same. Right?

[1] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00087.ht=
ml
