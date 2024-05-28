Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CFC16C875
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901561; cv=fail; b=fnI6CGZnoy4aGKquiRcOtI20eb/pf9bIJYDUcLfqyAcqNGQMmT07GRQ3PSppsE8DXJetUqvzWViYN2z4flYkk2YEYsVfPkgeOrP0eMa7XQNQ1TbULwhN0Ja9o06wmJIRTC+W7/sJ6QOMmLGb6iTSsI+B4fMP24e/vgcUNKANu2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901561; c=relaxed/simple;
	bh=qW/5QMpY1UKD2+SHEZhFbN5wmNdoSEzyNC8bVl1CHFg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s0iqEPDVbxSKmw31bLySgr04qJmDvZhaAlPSIlHeqRYHpazcqvEXKUmHfRROQn/9YftaOYoG0962Rp44mJENnAV/pjpu3uzxMPlD5HZwEzPc6Zr2XHVaqDMFbXXK5iUduR6ll1VtHEyAeAD/U/9JfIaYLux8FitGy5dhlg1pj7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GJecrCAR; arc=fail smtp.client-ip=40.107.237.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GJecrCAR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7Ca7aKQ5miekbKZ4ABpN128VyDWCw/7v3CQxGDf3QW0bqWBgXtIGJYztKisGWDf8fnsNkyLtDEC8VeRyO4L0hXYEYh5VvnHwmif7num6ICxjLJOtuLuLN+wNSHKPMkNemdLU1lI012TiMLf+RcHojJo/PufvVYqX+py1+08pK9FX+cBTg8412CPREgp81bRRD55JWkJkbtt2Q9Hd/apcaA5pq9qdm8Qay1Cdp4kPOLGk/w9aUGCwJKkPIzjryXJdCCJ6TSPfSDw88vrciOw4p6wHYB89P/H4M9zNKr2BzBFbfJc7gr8WZjhf3OPjmJZ8ghSE3uHVx1R+WzviP9T2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFKYCFucIOP1lhFqs5CJWsvLXE+m2rHFiU1NxekwiHs=;
 b=dNlSFN4tmA+/ovqr3SqocR9LO7fhckt++PyqQZ0VaSTkg3d0FvkfXVJxDujHDzNnfR+2m+EfNpccr51g6jAft5VrxKgpE1kCXyfxs1wxZS7XgV72KY5qZxenEloODkKLHKnr+5FfZ0Euu401r/rsmJul/Gvqd90iol5W09JfFykEbdQRZycyYl67nw09qE4aji582upfl3QxrnL8hjnJXG7Au5Kz0b4TmHP5j+epUMjPOCv63z+zW+Zdv9+2OYwp6W5BdHNkHzJ89ghMzWxRqTaazYsy79NosIjwFltoFnmxLNL0URa9orsBb6ZiY0n7qGzPjrjUFymGQvvsRqGFnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFKYCFucIOP1lhFqs5CJWsvLXE+m2rHFiU1NxekwiHs=;
 b=GJecrCARM70ZqPjQNa/IlnIJLzHNpm24ytaUIavYntdH06aGyEIGKKTU01b5QpVXX3tS9L5TiS+CafYF5zVHQYsJup/NAQg2g/e6AACiU++P0v6z/XDKc6w7wQx/bH1ZnENGEvqkin9RTYVQoMb8H8PZF9zI/oGGixAG5m8OIwae4pqJ3yxWfnzwRIcnrDd+vPXA4mEyBY9Asd4bPDaLV9dxa5G9hY9pYfXkDHie/aa8a2EYXFbSgZy0Z82Jy4K2RB2iPUE3oK5NiykLO60VfdgiqbVMtp755c5tIUYVRbMFHGj22VYP5m8/wB//GKIMAkIBUyZtz9pTTc19Uz2kqQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 13:05:54 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 13:05:53 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment
	<virtio-comment@lists.linux.dev>
Subject: RE: [RFC] Process to request a vote for an issue
Thread-Topic: [RFC] Process to request a vote for an issue
Thread-Index: AQHasP3AyMIVoq14sE6L5ccrkKI487Gsmywg
Date: Tue, 28 May 2024 13:05:53 +0000
Message-ID:
 <PH0PR12MB5481E79A58E5D2AF6ADEBE72DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <87plt6nlq4.fsf@redhat.com>
In-Reply-To: <87plt6nlq4.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB8474:EE_
x-ms-office365-filtering-correlation-id: 8f49aeb8-44d6-4d40-70d3-08dc7f16e7db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?425JQV95OeuF5bfFG82QR6Cju6Y78xT2y+mRySiGUwLiM1XnzKe9akRVkoos?=
 =?us-ascii?Q?9fL0zxx7gQztYCCHg3wrMCeP+K01p+b0F5ElxO06SWDrrZz+PyJj2sJv1Bn9?=
 =?us-ascii?Q?NjhqpSGV/KNzN+iQL6R/cmYd6GDMwMrb2kt+Ishq4jvYXS3lrS4+wNsJtz0O?=
 =?us-ascii?Q?+R98Tw1I2G6nm/UU8281z8ByB8cWbRc67VybOugkWS0qMIO2rRs8UHPMNGHs?=
 =?us-ascii?Q?3waWwxOZ0JzgjuMu1ZNKbHql5jiGB7b1KnKFqdTucv0kFkMp+EEw48z8+UC9?=
 =?us-ascii?Q?pJB3IXAXnX1s71ZRDL0EjKefAHlgbca4gvOknYVrO9bNDSlBjIgRwsUr6y68?=
 =?us-ascii?Q?ipEKzqbaLM2MeviXBP1NgsQBhl6/+uoKNHHKCq+vaDb13HBMEQDNHAc4lEKj?=
 =?us-ascii?Q?mL6t8bCoQOwXiooLXKYYEOq/u56nNq24G/yDEZkziCHhx3ZORqmU4FMKyrTX?=
 =?us-ascii?Q?LrcnTgvTn2cCaWg2zepDQvybomoyS+ok/dhdc70h5wOo17/mBBsnusKRyjOm?=
 =?us-ascii?Q?ry0niHx0J0UA04aWjNz4NvP80bxfjlDH6cO4SwkXCWr2Btj6WamWKUnDppzj?=
 =?us-ascii?Q?XrNDlMJilttciJ/n+LQQn0X/6tSNgZwekOIj2PgTBkkizrDFd7XzbeTIru52?=
 =?us-ascii?Q?VIRliOaMFdkCqP1HVAlGwcOy75UfQ6MviUKCvpQX5CReGWFu40XacOyTfY4K?=
 =?us-ascii?Q?l7yKtUMAqNR/OZe/M2BTrDocZUo2r+RG5S8uEzF6zGBMRr0TLyugXLFPjFQ5?=
 =?us-ascii?Q?c8ma3/BSlEms+zLDikEKbZi7BL1wSa9L4wSMgU5zIGbZSyH3CIyIrnj0F07w?=
 =?us-ascii?Q?yX6R+59J5D9QpOMVxDgzh2AYcch66O0glWjysv0KdK2ucDWXOFZW2swxJivG?=
 =?us-ascii?Q?X3lCKzAmTVlzasrLj7K81TU1OGSzO9Mh0phdmMGtkh2HIt+YS4RRsfVHmsVM?=
 =?us-ascii?Q?V7iS4m77hlGyv6pJSCp3YStqoXw7TweBqKCTd8x+MY+jkyboMnB9UWaThE2G?=
 =?us-ascii?Q?Jv1WNRUI7EfRErjWkxIfL161TD9BM/KdxJ7a2g8jwKWxPNxsvliGkHTjmN2o?=
 =?us-ascii?Q?GT64lBsqD+2nrbxdZsU8X8VycyB6yz1RzajhMli40hdGLnVxXY22k/a9bS5h?=
 =?us-ascii?Q?lsOW3pUx0QrvEKVz1KiUrI2uc559LEsBU42hCUfSHVRzDdhc5oz6wHipBhen?=
 =?us-ascii?Q?pksvtE/BnrMUsNXG5kkjaJCU5b9ISHzviBSzQQtZf+J3xWF3rYcMTFGh63ny?=
 =?us-ascii?Q?0bmCDIx0Ia2nvUEX5bDTtrnCWOYxT8NQ1G6xazf9C/KUQ0g27LLNOds95pCz?=
 =?us-ascii?Q?EY8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DYjlQ3CuGFnoUwfwhAr9Gq1rbk92ZhyHwbpCnwQaS0z84/Nel/2gzCFeA/cK?=
 =?us-ascii?Q?0L6KMqM4pgPtNYs29PaI4VF8e4oFIEUmhAI2vi2/TUaOqAPB6obuVb5XBzPD?=
 =?us-ascii?Q?L9ti2E5idufYl8JmscXw/uKjDXgLpt2C4Od0Ju7Jfpuq2iWMb+ch/rcOnsiH?=
 =?us-ascii?Q?deDMiS1DEZCoZgwT4DQF+STSNmfsfbUiSqo1QsHQU12P24XurT5yxTQ6K02w?=
 =?us-ascii?Q?oT5NkQfIyDh+Z6HBmY/TlWinLnuON5JK5N38yfOS2BvtSt4Tta/jO1VX2Lek?=
 =?us-ascii?Q?dO8TorYDo1kcF6DgsGc9rpubWxiy3/5OXRnonGz8V1EWdob9BdWT4QX+LSaQ?=
 =?us-ascii?Q?BBFVgJ4b/VLh1UAi38oYs0oZbIhLos0SsqbUBOj2Kx+fKYj1shw0AFvHgFnc?=
 =?us-ascii?Q?EdygRCNDzoWYzz6NmgXm1o/tG7nSX2uPnYM+ebsW1uYFe+xmAL/9BwamzUAN?=
 =?us-ascii?Q?szcxtgCgY/hn4yQt7dTT5IrosBcHyhneUdl+Id41e31DhUbN7GMFSpLebkrQ?=
 =?us-ascii?Q?Mo5SfbKypqi9lZ/slkphQtEeZNza/tjoHxYKSKJMOMdXFj1VlBjJUyeecdmi?=
 =?us-ascii?Q?EcTTYD3DASGx5raElRAMPCjWppu8mMdL8VKZfH6Qvs2Lcoi7PIHrKNRCwbfE?=
 =?us-ascii?Q?GX49ED8i0QFjoHWABJITeJw+87CjkqchjBm9RCgL0uedgTytdjuMSYwOEDaT?=
 =?us-ascii?Q?HUq/y3upDIhr/PtY+jj//5caII+Xvb1uJdtDQ0Plcd0o+Bo2VdiQJhyYCWC7?=
 =?us-ascii?Q?/iiQMzYt1BYy+kzSE5Ig1mZbV2UQ/XnsCFG87EuuzdLOt1ijMt/qG2aJ6pJl?=
 =?us-ascii?Q?imOHzWUqIxBVMhkipLXmanRCJzOWRpcDDwNr+dk9aVoWi8afwz5xMavoZWtw?=
 =?us-ascii?Q?8KahLGj0bD2j1nxFLQL06KNe6cI/NH+TXq1rrcmFl+WDhMUEsyVNY2tWP+CC?=
 =?us-ascii?Q?l+NxxuUuBxfkVF/jV9DiyRvMofj5A32N95yecZKMXUomLpCBMn+/E7KNKDWj?=
 =?us-ascii?Q?m684zhAHV+bzxf8AUvqRrxz07V6sPKu7OMWkYj9gb5lSscMH+IfzlgWDSrv6?=
 =?us-ascii?Q?wPxst7MAs1jh2M2LSIodm1vRUgB2kW0KT8QhG1upwu6l6q6XwxLSLZxd+8T1?=
 =?us-ascii?Q?cjHkAmph4rhutUJ+buheNAPpBmWhE8iXIbBPqVCS0Yh1I5orTOlchv4iuJdl?=
 =?us-ascii?Q?n7Ls5TwbvKJZFaVUpJg0IEw+ETr9edLDYINZXXNFc6WtopgkXawj++GbP0k0?=
 =?us-ascii?Q?lbuEuZMXEGhs4C5t1XGkvB8kr8iLx3GcV6hjDX2vmQanrak/hZt45+vGlq6N?=
 =?us-ascii?Q?gZbFRnt+BYs0uYqqbQjcSX8RYZFVv+X9/Sm2RBWyzaAaYrQCi2dsYHJeS2e4?=
 =?us-ascii?Q?xdpZ7LtDDLmRxxplRG3pf9UD5m87DkwcPXfPSNingfpyRGEBAuIAHctceXUQ?=
 =?us-ascii?Q?RGymszhBdCLOw73+VwCWpC83/biowkILEtjZoQ7HdzxjqnL7F8s9a29G4Sig?=
 =?us-ascii?Q?JtA4CnGgfmvij6MbY3oSKfuFRD7ljv45pZAGP3GmptOZzwJGLD8Kzu59C7qb?=
 =?us-ascii?Q?49IRZD7oayO8S7E/udc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f49aeb8-44d6-4d40-70d3-08dc7f16e7db
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 13:05:53.5350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ToRp89FBVsCsCskde+q6IveEiAbm0aHsQVozo9rHjcTEcpTWVF+hWd2/8giPf1Qed85xzvSBUGcfpGzE898hOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474

> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Tuesday, May 28, 2024 6:21 PM
>=20
> [first of all: there are still issues with our usage of the platform...]
>=20
> [Also, first discussing this on virtio-comment, as this is (a) where peop=
le who
> want to submit changes usually are subscribed, and (b) an actually workin=
g
> list, unlike the list for the TC...]
>=20
> The current process to include an update in the spec is something like th=
e
> following:
> - open a github issue
> - post a patch on the list, link it from the issue
>   - iterate through some review cycles
> - ask for a vote, so that the Chairs will open a ballot
>=20
> The last step currently mostly happens in the thread for the latest revis=
ion;
> such an email is easily missed if you're not actively following the discu=
ssion.
> IMHO it isn't a very reasonable expectation for the chairs to follow each=
 and
> every discussion in detail; at some point, it is much more reasonable to =
expect
> trusted reviewers and SMEs to reach a consensus.
>=20
> Therefore, I propose that
> - request for votes be posted in a new, separate thread, referring to
>   the version proposed for inclusion and=20
This looks good.

> ideally containing a note on
>   who deems this proposal ready for inclusion,
This additional overhead does not seem necessary because when you pull the =
patches using b4 tool.
It automatically captures who has reviewed, acked those patches like any ot=
her email based flow.

> - and those requests be clearly marked in the subject, for example with
>   a "[Request for vote]" prefix that can be easily filtered for.
>=20
This flow described here got to be present on the README.md and if possible=
 at [1] too.

With reworking the section [2] and [3] to write above text.

[1] https://groups.oasis-open.org/communities/tc-community-home2?CommunityK=
ey=3Db3f5efa5-0e12-4320-873b-018dc7d3f25c#feedback
[2] https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-g=
ithub-issues
[3] https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#implemen=
tation-discussion

> Thoughts, comments?
>=20

