Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390EA5337D
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716278766; cv=fail; b=U4Jd5bLYzKNzQ0vk4XMYrDY27NnSpUDZ+KhGlDYRL068cjqRH9COJTCXGx9lqv8TvCFVaz9OapMgrZU5apIDW1ea4Tanpwa4L0uKruvRXcJckyAYgYAdXNMea7SiLGETXG2ovgt1Uj82ZT4JOv66TccWLZFYusroDxpVyUwc1Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716278766; c=relaxed/simple;
	bh=qqewUrLiAoj0f5MnkQ0zdRcVHjtf1A0v2nOEaoJmKZU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hwsmjDWD5sBrRTJgw0CTwj8HNVbpDCtvSbtdeAyRVnHvCaF5eUyACTBqfiGc088dpvKFT9aUbU0UlpnOLHLkCotqGUdQcv6szPKu7yXlgE7kxR2e22/vKncvn+VsLxWZossubT4M6TgLTiOZRf0CmoHdB3kXaRFUBvm960DrjGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FqNp5FYr; arc=fail smtp.client-ip=40.107.95.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FqNp5FYr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUh3jGcADqvH3Dto0Kl/xMYR5fUci9UEWbK4Y2kj89jDnhpIzfQKxazwA9nFk0uzDLSctfTMZFhRB53dgBp7tbDD8+b2lHDG1/EwX3ruexpD4BRkI1TM5tkWd6FkTkbwv6suxKydnLLnqHjyviRqcjdWCo9rg7o1Ei37lZZaMGKNy8/WJEz/BUHlbLov9L3kKW3GKgNImdg57PiWOnTs+NmS7/YnJ/lZXGy0wGJJtx9WVQxeQ5Ea1RobjHc4PxZhq4VaHBMDhd7c4PdUTjFv9SW2NPESRADjsIy0lm9vIyy27pK65a07hJFWbRkLKyJOuBqN0Je1T++RcjDmDyxHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqewUrLiAoj0f5MnkQ0zdRcVHjtf1A0v2nOEaoJmKZU=;
 b=gQD/ZvrMNBf67SKtKGWtz6dVOBoDn362ZcHdNMVbofYPeJr5mvxTD+Fr6dLgs5Aw8Qk6Lh1cI600a0VLeC53FTYdNNMnd18WsnIkpmCVCRvc18PX6ux4Ty/FgxiGRNv8UJcbUS+rnNmPvYfFZZ77ELdTZojKlea947GDyy3OTleVtK0SaB2MyqEzczMl0wmL5lQIJoiZBAnbyE5zPt7/nUSQ6LDeZblX2q3DzJ3DTOGhIh2kATEsZqpNFX2nAwbFd4sl30uHX8hF24fgLAqW9oeafvTpIUdeiiYwHjFdi4BKyVS8z6ZlUWYLJBjTAF06kuNfMVOJAHBQIXpc0z7IlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqewUrLiAoj0f5MnkQ0zdRcVHjtf1A0v2nOEaoJmKZU=;
 b=FqNp5FYr6ZPomb0UuehyQxyGpFPeRCr/fbAx+Abg/mPSIqvdRLhmpuogCi+pxDfXII78o3z3NzS7mR4qBu2RZ3q+26Cg87c4suYrYe1Frc0WvPKx+7taLMegl7y+Rj0h9mtqbCXhvQI1h7ZLOOZ8s6FCoIgRBUjdAVRkGdXVMD6WjtLjd+dMTi3FoOeipvNhuRbUXt7FuFgY2NqI+EoAznu0lXtuf2pJLlZIdYLOWwI5CM/B+O/f+J7NFwZKslN4CmpCjJAgU9JU8NGVIpstE6Y2WY66M3t+klnwviqmLuI+NOYvqVvAhjaj42pcti+sWgj0Zl7rIC80xVFPb4jkTA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DS0PR12MB8341.namprd12.prod.outlook.com (2603:10b6:8:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 08:06:01 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 08:06:01 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v3] README.md: update mailing list info
Thread-Topic: [PATCH v3] README.md: update mailing list info
Thread-Index:
 AQHapq3cqOwFBT2zLkCXuuWIgQjcxrGYE1qAgAAFLACAAABCoIAAAYUAgAkETgCAADPxgIAACJQQgAACWYCAAABX4A==
Date: Tue, 21 May 2024 08:06:01 +0000
Message-ID:
 <PH0PR12MB5481860865E69AAAAC3EE742DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515063503-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240521032438-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481168F6B161E51F8251992DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240521040243-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240521040243-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8341:EE_
x-ms-office365-filtering-correlation-id: c51ae2bb-28fe-4389-26c4-08dc796cdaa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kvieKVhFNNrL1PFjqcebvNs7XHUEsCZRoUwmvx+ROTBls/nbl2bZ3YnizixJ?=
 =?us-ascii?Q?lqzr82mMhwOo29y2Fn3obSGBS0biQWQgqC+ajAUl21W8uouCLqtjx/PdsRtM?=
 =?us-ascii?Q?J4jVjHpq+QYiNL5NtaP+sgeNtEEMUt1UeVoJQuH8vjrlbEPAunwN3+YX+1pr?=
 =?us-ascii?Q?oFLfPMt+perWvYsUEDqCL4Q26AI4YO2EJdKWEKmrE0S4cNfbg38sDzxH6zGL?=
 =?us-ascii?Q?HNkdsaPgEiT1nfZkngPA4HshxS7PPQWbVDKMWA07KgsnzGSOSmhrhN5Vnr9C?=
 =?us-ascii?Q?ckr+SDpNFZzkdue21ttoznGtMrNH6DmS28UBYE0uoEv0wwFpW3UqHxCwsBXE?=
 =?us-ascii?Q?HPgQnPvUY31lZ7mFVUMfoQNe9j0NNhG1OrEpc9sLytY8Kr9x9vP825UWw2FS?=
 =?us-ascii?Q?zcidgjv2ZC1OumnmEflheApG2Ra1WRp20EqQtqKbsa9F9XNHcuiA5k2eGg8t?=
 =?us-ascii?Q?yzEfV6UwpgY6NjOKu9yNK5OQAs9JOiwVCHSyrvJHmavPL2bLmdXpvw174Kjj?=
 =?us-ascii?Q?3TBpf7SCDJqZ90aEcu2vEF0Z9+eoo5lz/zyExYAubCrReJIrn0W4zwxBWcru?=
 =?us-ascii?Q?l1omKvQYPGhpck/IHaXn4LzjTAu687qfUScFEwLNHZ4V5O4G8bWyDnIC3tmb?=
 =?us-ascii?Q?5n8pbTJ21zmg4iMrLDzCkLAjxod/ON10eAUiqvVtn6T0e9D9a2vGC6jk8n90?=
 =?us-ascii?Q?q55CumRNupCCbWnYnt+nKIINLkaXMDRrCIwuQF1+GUbpp9KbqzuRiMY0CIFv?=
 =?us-ascii?Q?nJ2W7gjwG0/DQYY+mOVZpBY47GacxjaosEjNAnyBsuiiM49jsZiY2HPDTe+k?=
 =?us-ascii?Q?PrsG+UVPfRcS7wzvCQ1+2qDRdoOS02Dd5+Pd8pdqWcuZR1nhRNi39ORPk8wx?=
 =?us-ascii?Q?VQj2bOY1wnibPT+CTLyj7Tk44qVhDuQxu7dRUn0hbBT1aM+TVAby/v23Yt0B?=
 =?us-ascii?Q?9lwqQCwa/TCyfVz5R6Tez5EwxMBovK2RUXLZEw3/khSURw79k2kezBksw8zM?=
 =?us-ascii?Q?ZZPzS5eUv0nR6IDI5NupZdN+8MnJYf3Zk+LUionS7AxA2sASIXNGTrjxf8Uh?=
 =?us-ascii?Q?iMNy8H+CaR9jiQntvM4UpYTxILMSh654ND4oSLIvUOZn+B3sLCdnZ1vWW200?=
 =?us-ascii?Q?KVFi3ASnGniqkVHqlsIAGg4tmAnG6+U0as5YPeXkUT3RTX1w/FIwsjjrBQOZ?=
 =?us-ascii?Q?oAE6fCv3ee3GUOFLBuBjqYHqsPZPFJkSInLymHPemHwRB2sw82Mxqg85PJ77?=
 =?us-ascii?Q?VldlgG7oexZzPejBUi/48SVSAp1wTaJrU6WK1chdXg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gkSj+cy5UMfp87P6pUcDWAbqUjCp1Rueqs5IG4eZJNenFJdc94Mgm0We/FFM?=
 =?us-ascii?Q?6Yy84AA/Y5hlDQTCVYxxMOgXL7HRIdk8wUefd4eOKvdpo0n336Q6v0SHDNjR?=
 =?us-ascii?Q?qWMdbHF71yJhw2C8DjZJbZB74HzasvIj4MmwPYeMVlubK99vt2nZdpWDrZm5?=
 =?us-ascii?Q?F3LowuYVS5KstTmw9Cg71Es8Qi+xbJFqcu3vwivRYSSZCS91I03AaG3y0RRU?=
 =?us-ascii?Q?LDsP/i1s8e8NQy9HFSmUOTDCwjr2HGjykOiUXAFnUBV49td4plNdpA+PWje6?=
 =?us-ascii?Q?fpPaHiKOn3/1LvSU2i45lZzTuE6zDxrVSFGhk5T64fhPqgcHYqiHf+KiEvCT?=
 =?us-ascii?Q?xP4O+1zYKtyNnqpun5sPjWejA5StlntCcBp8UadRJuUxmsdPH7RpL1lfNdrL?=
 =?us-ascii?Q?K97xhYrYSeZBwF37cMPQIVxfCulpC8Wgf1jydF5cUWcwJG5bXHiRc0p4XrOU?=
 =?us-ascii?Q?oPNUFR5yM/zU7nF2ig7SUMCxkGvHvV9RLHlNNVN8bzB1CopCBq38KkSwzibm?=
 =?us-ascii?Q?a0/b3LDuByINQYya16e89jhwgu0F+MeZeqQ3it7/LaiVWvYPKXGb/OuU909C?=
 =?us-ascii?Q?Ium/fr1msbo7k4rHDQK8rh0PZtFm2QQ/sRO1DFe+M2d8Nw3A/hPNlsfuLvvH?=
 =?us-ascii?Q?ioWhc/GCovyoMDpUb0jReEX82JkNNtmOVgEepGDu1dPHF1Z7tYtnXLWpjiJA?=
 =?us-ascii?Q?GxV2V6et8s4Tjas6mt1IQ1wZr3GUWpJNLx2Xk5DMtX1P4sybAwrVe+qxf9cT?=
 =?us-ascii?Q?hMdWGcHunhrO57yydCSRupHXRD8FZYg5gVPrQl8coBM8Cth64ZKpyg9UOzTD?=
 =?us-ascii?Q?J2ujZmYYC7CukRgRm13X9Pq5zNvvpSzrsQPD7jBL4D9csAf6lHJGlj55Vwn8?=
 =?us-ascii?Q?xStDYEKl1+NLtNlpWjTEjXOPqlEWGwwqjGkoSKn50N3Tsw0C3oYn7W1wuV5C?=
 =?us-ascii?Q?4buEw0ZUjbHRf1rbkrpwS8dKYUXCgz0pr71pTcKCfQm5+JlYK4qokKeUdqdw?=
 =?us-ascii?Q?fKmdsUBh3KC4JcQu1QoqqpTra5WyyfYDGivdmYoDSQbOWqUY9u3bJyYBXqt+?=
 =?us-ascii?Q?yflGfNijMc7FUyQWWuM/V6duy27+z5944RdtkoNoxaFoavIxlGBIpUwjHmCr?=
 =?us-ascii?Q?B5r/vEe9w60K3VtbFvOcjUUidypsiVojvR7fgM/DcdmDIKlC33aoyD3YfLUk?=
 =?us-ascii?Q?a/KqFQkPhH7u/EPXN8cf/msu/00bzR535TLu+VckYCo+oXZy/OFlBWeUKhMw?=
 =?us-ascii?Q?9xgNXYp0YNxvZdAiNjbkrN4QR4ZAZ8lrBDi+x9fRPorFzVfVqDndWcgfi/LX?=
 =?us-ascii?Q?Xm564acSnY0rU3gQPUSMV2+Mwvx2Fl7p9scaPSJ5SFR8m2psEf4vpz+nxYsW?=
 =?us-ascii?Q?8yKHU4oEvgz0ELrmbImM/UCdBv99jYBgNshHdKFCJ2VlcY6oRv/QkWVDSwRT?=
 =?us-ascii?Q?gAEYXbxcrAnm/5isH0sN3Ap1k/0Of3wJUWbpW+ywawxnLjjHX7mvqBTbM3Fb?=
 =?us-ascii?Q?jnWsPr9w3h+4QPHC99xZYBuGOm9dY6Z+6rC43JHlMq3mDvfwg/UTI+sZ7rBX?=
 =?us-ascii?Q?RBWKtKEM0kBD7IDydJ0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c51ae2bb-28fe-4389-26c4-08dc796cdaa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 08:06:01.0915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: njiSEJKz+9Otr7On27rcSDuKvvUwobIhBeSlUPP2o6HySUUpbGuPLR+tcNbfesifWlR4FTgqrRNpQl2wLJMLWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8341


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, May 21, 2024 1:34 PM
>=20
> On Tue, May 21, 2024 at 07:59:03AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Tuesday, May 21, 2024 12:55 PM
> > >
> > > On Tue, May 21, 2024 at 04:19:31AM +0000, Parav Pandit wrote:
> > > > Hi Michael,
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Wednesday, May 15, 2024 4:07 PM
> > > >
> > > > > > > I would wait until next Monday at least. Give everyone time
> > > > > > > to subscribe to the new list.
> > > >
> > > > Can you please merge this patch?
> > >
> > > Pushed now.
> >
> > Thanks Michael.
> > Cornelia mentioned in [1] that master and 1.4 should be merged.
> > 1.4 is 17 patches behind the master including this one.
> >
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
> I think I'll let Cornelia do it. This patch should be cherry picked for
> 1.3 I think.
Do you mean to cherry pick for 1.4 because 1.3 is already released?
