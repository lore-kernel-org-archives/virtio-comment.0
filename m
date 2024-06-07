Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749A017571
	for <virtio-comment@lists.linux.dev>; Fri,  7 Jun 2024 03:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717731815; cv=fail; b=CF8NG8xhQNtelYIco2HDFDwK/bxjVoDyAueN5Duj+JJ1VRykIa0Gs5me+b/sqHwsSMjo1z+Yqv5PvKfAForPZlVqPHaCJQfSwlZF0vFAbJgKEakxw+UnyjzyA9e3GqO9aEG1q5eRGc7HlXUruXQ5VVQRAdKkO36YzL5dN4imiR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717731815; c=relaxed/simple;
	bh=xysignf4wdEgCgZgXAwCf/WWMzbWDwkJv7/eeDFhOQk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qOQYgINX/feFAfzIXlCkmAI4fr/1uH33V+nxmgTlD+Z9z8ZdYMrs6hVUMRPAUtSzLpJ6dR2lg6O4x4a19mO517ckW9FuiCyOV5RiMl2kMI2h72HVNMZ6S4ke8qkOk830YVfNpUSAIYBu/75Asr/2do7wF9tpvTQQrWO46KjJHyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MDEgNI1f; arc=fail smtp.client-ip=40.107.243.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MDEgNI1f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwKYrA1exRCn5I7aYTfyQZKJ9HIT1g9ebHUmLsdQqWByzM+poza1N1Bgd+tB38BBJWEb1hkHkTD8oikhURs+oWtaybxPtKiB3M16/7XwrYABHrKm94x9J9qOAgkVmd8EnuJIgYPbYQk1nblxQ+JJ+GsdvPx9GzQUy+pan98xhByBGeOHY6ayEJyCoNPfWHsmNqnJfixe3Nn0ywKXgwHr8fkGOmKW832dz9pwaCl2oeJu4pjSkG1/yt6bc/owrAShkOenHhfm1nW8uvo4CfDne3/d8xVS3MlO1zLlFftDK+jo+yl4THawfJOWS6I5eBFaRbgfMFOzz+0SqZXzEAqzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xysignf4wdEgCgZgXAwCf/WWMzbWDwkJv7/eeDFhOQk=;
 b=GXoUDYtEweBwOThnrBm3fTlvElY7jk2ifwHjFbBLVRz98I45pRFR7sW3oFdoqTed7lRKUofHeIcHryMcpwhZNdfXJnkFZs2H7VM+UQZYjumBmHARmUCdJiU020L21IcepYFZwAwcnP4LIJjBve+tzFf4nop7sDJC+qlBQzw4CEFKyQxrOfnFxZ2F/aBhnTOBPjcgfJqNSF3xPflUj/NZVp6FAh9ZuEJFG4BAtybrCr9g5K83zyURbyhmwGt59KugYxfQHFn2VYVO/4eF16utTy+fLfLKyNCX8kaWr4Jt/Dkn/oBZEsDykA3OPHQQw+0ABEyErQ3p4nvWGZeYk+vgOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xysignf4wdEgCgZgXAwCf/WWMzbWDwkJv7/eeDFhOQk=;
 b=MDEgNI1fbkufKsLYnitfCaIRQ+gZg/zja7fBDDBwusryLKh4T00eU+HRIcD7p2lzSw0UiyP4Rd98k9AXT07Ta7k/OvrcmJqJhNYcWoddEV64nPRPKZF4dNaqV856WEr7WxiIlhhJxI6M9cBQp8sIu69IUndCahZkCIseRLVqN/XH3QiUiZ1knZZGdPbR6XK+x9dHIPo1wquyOyeJof0t2PdPfvy80rOXk6fra9s78E79np/qaYsyJz4anbl/njNMn6YajDgRN1FiXADflirwxJTokXKxHa+3ltRtFwoLnhToR+kjP7eCd+rPyoFtirRDpXaEXsBTACPz4fcd4e76dA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CY5PR12MB6156.namprd12.prod.outlook.com (2603:10b6:930:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Fri, 7 Jun
 2024 03:43:30 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 03:43:30 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: ballot system back on
Thread-Topic: ballot system back on
Thread-Index: AQHauAxVYLMTy2eUBUKT7laod5IJDbG6828AgAAzigCAAIG0UA==
Date: Fri, 7 Jun 2024 03:43:30 +0000
Message-ID:
 <PH0PR12MB5481B75009073F188A5716A8DCFB2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240606082035-mutt-send-email-mst@kernel.org>
 <87ed9akoab.fsf@redhat.com> <20240606145829-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240606145829-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6156:EE_
x-ms-office365-filtering-correlation-id: 79f6b705-6e9a-457a-09df-08dc86a3ff92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?i8l604lHDi7DcRasGtroQqQoYnnPvyMv14B5fWkwMP7DXTvGN5ZsYSLwMEo8?=
 =?us-ascii?Q?zqTi/g63rWXiWzO30bIEFy+ZXUX16Iy0WFlJHE6LmKGA2+RWU9ZdUmzZqA4Z?=
 =?us-ascii?Q?Zqdf3IV8/NpOvhKA9XOSh8Ip1EOUvAcfFyMn0TXIdhZjwHDDD7SGqkhyIGSO?=
 =?us-ascii?Q?fd9jXsWRge7m0ZDdCFoUSGthmifii/dPQlh6aZwxkKhl8htz3JUKfb6zJYFu?=
 =?us-ascii?Q?ZfkTASHlgD5WKMhPMEdAA23JXgWL9k+n9nA8UZ4wRazbTCPHEHtB9bmzm8YT?=
 =?us-ascii?Q?31u2UxGbZsDXM3K5uTH/h7/y//YWBL/SeeYwapvGJFF8cD+TLe2AmG/5kzVq?=
 =?us-ascii?Q?Q5F6lmApuAEA+zgiAHJoc1fkJbhEdM3VAlXMoB/BAmeLrbYu2ImkjCuoSB9v?=
 =?us-ascii?Q?f+jXC1B3WeUWLEIrAYZwrGjL8IOzGl8c7I9YH+kXbP1hTbJ/EnLqa/Y92xow?=
 =?us-ascii?Q?PeKoG6cd3SdfbB60GzEICx2PtQapSwuINEFL/59Z1xqP8Zrf3Roo0dQJno71?=
 =?us-ascii?Q?EWHwNVx7wBEMhi275oc92o/6sGPNLqW9vgaT/ksJW3/wOfckVwqP4Kn0Mc2j?=
 =?us-ascii?Q?JRPDM0qq2dA3hGF3cHyHpuClPbKmU4++5Cim4INdxW2Mgg+Ucw+WpVkKLnFS?=
 =?us-ascii?Q?FJujkiu/N+T+8fqmmX1k4Z2Jsw6vhNkALfujwi3E/jtpPXKGshiSDxibS4JC?=
 =?us-ascii?Q?8ylFP4WqXN1lDsVR7Zuz8udmz6TECZGBM/zIoWE3Nwk92pPowR1rtHc7jzrv?=
 =?us-ascii?Q?t7fbpkyz8WjdNAf27YmO4V83h5JnDbyoDHqw0OoLAtGF02KfZSdO6VZgnVki?=
 =?us-ascii?Q?0O5myGHrQ4RdKGLBS+s0hGTcSE9XyKXGzoLABZrR6TcaZ3HFNTo6vo6MEPU6?=
 =?us-ascii?Q?Zog0e3kIGadOFYf9hQkhBTGd5OXYkTpWgmH06s8l5UgU40iUCDKKu3vkBmM2?=
 =?us-ascii?Q?pJdeZXVvc2V+/Cq4QrBeA9HHzLrmAvGOaXhhpZa+6XYPxpOdH1yOpst2sqEX?=
 =?us-ascii?Q?4ytcjZ10J5YPPn4/n0CYoY1+J+bTh1RP/Y76Y6jRduCflLsDBqq8yGTWZrxk?=
 =?us-ascii?Q?kfE9rKzsS21PISYkuLWGXk8LWZNIqRuJ5+wMR9bJkjbb19yyeaF5z/vZEokQ?=
 =?us-ascii?Q?cCMi5CMV0N2kEiw5UAejbl98Y1HCWdKiqWsO0J4FNhXVj+Zw8OgHdUQ6GjSd?=
 =?us-ascii?Q?PG3ckeKYuPW4iTRqw0xPchPsHQqHH0+FJCmoW9T8Ujdi3mviku8IunXTnckE?=
 =?us-ascii?Q?vyEG9NFeoXRHnQcr0OcdwPeLqyb3S6g/NEeeYNGXC9/3350sCeyrqfdeZjV4?=
 =?us-ascii?Q?mfUMUWgyXGZwQn2gX6PXzYWHr81IjMI/E3zi/1yt0LMN3jlEaZyI0jF0zhtL?=
 =?us-ascii?Q?yyUW6Dg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CTboWHJ1YgLXmh3S/X8MwIRjf6risF/lhXpFFGy5Ui3i1FgHXzhCdx+/d2+p?=
 =?us-ascii?Q?Y5EdpsyWdP7jsK75OPtWMzEeqY74enCF/pzmwgQg0jAuraFvAUDlxgKd/UR4?=
 =?us-ascii?Q?dhowSMfEXkaEymsWBoZV0IIyC9v9cRFWMpUzDUjOeTtlPtBuV3YUUHmlm1da?=
 =?us-ascii?Q?s3c6QsIlnk4/gXD/1cQtyBZtzB8ai4fSuoDemoK3KKataGV5OW9Q0hQwlb6J?=
 =?us-ascii?Q?V8K2L5pOE4LUMLz/BimlnbNdWi+IRZKquOK/tAfFleHUsVsn8rde7jcMJ3xB?=
 =?us-ascii?Q?WRlncZn/LECF7hfGYqYKfH2ladNUm3x8pV3QIqEUzAum6PuRoUmZc03B8yBs?=
 =?us-ascii?Q?ISPQaCzkMdkHKcArwYUCgKqDav6+/2a1vEnP9cVIOXQvcuWZF3P0ptcfV2e3?=
 =?us-ascii?Q?poUYxw41ks23jMl8YtExzGcrm1ETEq9HmQqmLam4oGbkjnmTPp8CQsJOHoVo?=
 =?us-ascii?Q?ssljVQUEdh9kJ/4rV/e9Q494x1tZPI10jSCFxrqcyzCg/47/BAlVUD5LlQ9G?=
 =?us-ascii?Q?7yu21AiNiMdiJlOzJD4WoU7dLO47VBxDKpo0aRxvTcszfVp0bFTno9L7Ob1u?=
 =?us-ascii?Q?M7lhRCZulScxFRtd662rNfK6S24pH6mIix1PVZpb9ItrieDnuJPA0uXbEZvM?=
 =?us-ascii?Q?O3tRYxQaAwbpgebjx/oiZoUcHo7zs8vgjW2KmOUlvg0Ioim+ctV2i6a8gqH9?=
 =?us-ascii?Q?okAfYlcHR6vFFP+eSA8B/yVNCITR/o5fRi2OwH0QPaJ99IHWNEp8ga5JEjiy?=
 =?us-ascii?Q?GYMVHwl6Q8YUH28a0mQdzDQUhvhG8ELX8Fka1g+L/32BJknecGlg/LPVHQDX?=
 =?us-ascii?Q?v8lw2WZvbQainAtJ45ERsTjR/D+vXEdc4ET2+ZFjK2CIV6aclkeeiLjDd5aV?=
 =?us-ascii?Q?33Frw1ks4HmpIyZy9Si0lHtkrjAbewBqHxbujy3L2D2eGOn90ep9y1u8+DoD?=
 =?us-ascii?Q?purxIPC9G9OVaqm5G7cUOMK440fYPPDI9qRJRvCQWXZPEQzC3k5rRoABmVsp?=
 =?us-ascii?Q?km+vOBZXfMiEPW93kG7pTBZMeVf5RSUEC41poaRJbJHv/NCtHeNiX1Dyrr1t?=
 =?us-ascii?Q?C1oGG7oUSdAZJmWjDJwf7pJozEUe9bpV50RS8+WDMEzKdlLES0lBY3bV1E2a?=
 =?us-ascii?Q?dtb8Tofr81v3+X8/Lu1Qqkx8cCeMwDoQtbD3rLXiHqraouBzp7L7WhqMO7Zw?=
 =?us-ascii?Q?p2b54wM8+goS9nr36mfaNMRNYJ8C+15uO4OgJty8ZNKTmJtBz99Ym6U2u8PM?=
 =?us-ascii?Q?8UgyL5k3QDakz38vMcGO1FN/hONRkpJoFtDhvyu7fNCAGXFZA7v8+ERVD3Jp?=
 =?us-ascii?Q?1WNMN9WyHcPvPBP3Qg/Jb1OldPAUXuxNHF4SuTp9ENSQ1jyATR3RO+bJkcaV?=
 =?us-ascii?Q?jkdPtCALa+TfiVNs22mUNF696S4gST9BLUyw8Gk6RxZOzJlSji8oq6jQewy0?=
 =?us-ascii?Q?2lMAnlJnz+tD2NdwksUUV3MP9b4R/zFlHZ1lSFbrJgQ2n+HJh934e0DXPDaL?=
 =?us-ascii?Q?rs8cYDsr1Ft319tUzubtGKLJxQpuRUIU6xUaffGN+COEEe/iTc6NQNEL3pnz?=
 =?us-ascii?Q?WuRzzToN2VtRqfp5M9A=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f6b705-6e9a-457a-09df-08dc86a3ff92
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 03:43:30.4827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HEL8o3YBhtJjJ08T9iB5a2q+lCclw9RInFcyatRCAmixG6uJujGhfukWmNMbPehX7dIJDiVxytrWBQXaTgrI/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6156



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, June 7, 2024 1:26 AM
>=20
> On Thu, Jun 06, 2024 at 06:51:24PM +0200, Cornelia Huck wrote:
> > On Thu, Jun 06 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > > So, things seem to be working, even if they are now a bit harder to
> > > set up.
> > > Let's start wrapping up 1.3?
> > > I think we need to pack up and then do a ballot to ask OASIS to get
> > > a special majority vote for us.
> > >
> > > Right? Cornelia, want to start that?
> >
> > I've now created a ballot to request a special majority vote; please
> > double-check whether I got the incantations right.
> >
> > And because all that work is not really visible: Thank you for getting
> > those ballot scripts working with the new platform! This looks really
> > painful and time consuming...
>=20
> Yes it was!
> But in two months we did not get API access so reverse engineering it is.
> What made it hard was that the new system does so much in javascript. Bot=
h
> the login system (it's a single site why does it need
> SAML?) and the ballot form itself (lots of asychronous stuff, animations,=
 even
> a simple checkbox is hidden and implemented from scratch in javascript
> because reasons). So I could not just use selenium APIs (wasted a ton of =
time
> trying to figure out why). I started trying to emulate keypresses and mou=
se
> clicks but that proved too hard to get right. In the end I hit on the app=
roach
> of injecting javascript into page to interact with the hidden form elemen=
ts.
> Thanks,
>=20
Thanks a lot Michael for the heavy lifting to get this operational.
At least I didn't realize why the voting system needs such additional work =
specially when its upgraded.
Is it for the github integration?
