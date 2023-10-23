Return-Path: <virtio-comment-return-7921-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523A6C004C0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 14:53:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7992F71C89
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 14:53:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62E4B986699
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 14:53:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4EC96986679; Mon, 23 Oct 2023 14:53:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3EE8D98667A
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 14:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHX/Z8rX1gFgiVEKPXZl/A00Y9TKqMKqhTauzutzLLIxIe9ERXSMZS7eCJTGomrBUZZF+y8OO8Y529zPCaq658V2+Ox9mNh37o7WK5Qe+VKVQr0ovHG56aouQ4upzGoy01eUl1suz8qG8lIOO1VSzpGuLPUETRBMlLp8WBBQOaklVN4k9jx512KQJOqKjTf0V0u78C03QxfssZiRKEvJX9iLjyOWITzS98rOVOAsq9XcaS9XwVN70D5Mo7+t9VZDXNWs8u9dygynndCO/NzdlRK+vnlfiHDQaXPYxzBB3OelpkUF1o0cgYJBjYQhI6wY8KAa311dyQ+lO/lXf7vTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fg9aA8/LQ4Cxjxbt0Z8d8N1HsvLeqoOnnokDAx/j7TU=;
 b=UTKMFcg8Ca7DqdwuhjKsyjzhsfxYQPECi/Rh8218Fa9fyKfb6iD+wAZsm1hUkCVAOVQGV0N0Piio/Ed8hrkvHeQJCKp4tzflh+jLAmUMNcNHoYhhrmDAYycE6eXkilvvu7Dx8/B96L6bgT0bOdIlRryNmtNilGGUVKIfWCr7Q4uz64i0E7R3MdL0t8EYTT1lwzw/wNDTsr/HVNPBExQmv2NR8XmhCqc964mm51b0U5igdRJvHnpg/iL19yt0ETD3Zehk/MJ0xRSsOQ3PPi7QXadk+yw6Nw6nFKESUAFnp4/7f5EiRUmt1jjvTpvL3b87aU/Duf0zjwYqB1FfDjWvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IA==
Date: Mon, 23 Oct 2023 14:53:44 +0000
Message-ID:
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com> <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87sf68cjn0.fsf@redhat.com> <20231018062704-mutt-send-email-mst@kernel.org>
 <87pm1cchuq.fsf@redhat.com>
 <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548188345E2CF3B8AA5E2DEDDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com>
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
In-Reply-To: <87wmvdbehg.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY8PR12MB7292:EE_
x-ms-office365-filtering-correlation-id: 49dfb417-d101-47e1-a9a4-08dbd3d7daa3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Wkes0n292gumGBZnawoBmC6j1y9EckoU+pcLxXup9ac9j2/Z1ppCMRXf1cfAYJL2jCN3vdsTTrETOC/fEsycAyCt2lATdfOC4L+ar9A9DrQXEWr2uE9cXPdQbByfkvssy9+DyPte6nOjJrmq454LaDFJ7fb84mhqe8Qb3eqhyHR7cWTccxPjbsT5Ksq4hVgMVd3K13yBDUAeFCtYNp2eEgfQnxemD2lobwpNqhclo8VJj4x6eFjt4z9yR1wSNJ7ZYVrLcq+kMaC5j6ofvRC3wo5LQ57KZyGX17yfmMmP9vu7jXNw4VI/0WgJoDDQXfrLNlgk7NVn/0dmsVcuVUBBSHjMrhsfIyYCJ/3rhUOYxwRM/b4ubfix7AjpCWjPX+sI/2XNRZsqWoinq1RRZT3lC9kiJNOvsBlFsJWPWqgknLm2aWvfY7s5fJDv3ttmYCuoR77fspPM2aMDYjdff+5ao5EcHP9tGODG1181zRJ26XTZ08YcywLCwgSzK6yo9YYuFWWh6UxOK5sZmO+tQUmhG5pmfywBsfxJuMH+ObthaWN7IGzfl++iGMkTBLa39YDE7mPtlgiHo7WisBr+LrAdLTspPVSIaizY3bBXdwU0MADgqn0hWILUdXU+Vbxlh5KC0v3y/G+zMN781J+5zoWne4muINB2SHr0wxjKYo4RSx/71FZ/DUHxfBGtxa1o7/T3c/6wwEuz4CsP4r41vPI4xQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(26005)(38070700009)(38100700002)(2906002)(4744005)(55016003)(41300700001)(86362001)(52536014)(5660300002)(8676002)(8936002)(33656002)(4326008)(478600001)(7696005)(107886003)(71200400001)(110136005)(64756008)(66476007)(316002)(122000001)(76116006)(54906003)(66446008)(66946007)(66556008)(6506007)(83380400001)(55236004)(966005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnVrTVF1QWlFUzJmNEpTQTA4Mmt6dDJ1K3pYems4eGVKUzNCb3UzM0FPS3JX?=
 =?utf-8?B?eUd4MXkxMitiVUV0bCtaaVNwaFZmU2VJMTVXa0pka2lFZmdGNnJXRDloVnp0?=
 =?utf-8?B?TEJRQUlCT2E2QW9JeTY5T3BtK1BiVnJKcTNsVE11UWE1bEk1TzJjZGRWNGJu?=
 =?utf-8?B?ZmlqRGF1dXZxTjZ1VUdBVVBvQlB6STUrSUMrQUxSSWpxMkh6QlVHZXpoOEEw?=
 =?utf-8?B?M1hsUUVYQUhNclpMd29lQ2VSSHVjL3ZQdUNvb2krQkw2UmdMRWlyc1hsb1RC?=
 =?utf-8?B?OGozREc1OVRoWnVKQkY0bVNFcE1Ed3Rrb29BYmwxc3N4OEJ3QXpjRGJTK3E5?=
 =?utf-8?B?M0JlYTV6NnQ2bXhraVpncFJFWHdTMURYbVloaXB4akpGM1dmR3hyak1TRkdZ?=
 =?utf-8?B?eGErY1d6MmRaaGFVcDljSUlBeW1ackV0VEtHQ2IwemRDbm1kVmV3bkduVW1M?=
 =?utf-8?B?UXV4OUZQZDk1eFMyeHp0UmN6aUtwc244dmhpUXd6QW84T1YwUjZCcHRad3VZ?=
 =?utf-8?B?clgwQjdMREUwMUdqTkRZKy9ReDNNVVU1cmQrWnlEcFZEWmtkVVQ5aEw3ai84?=
 =?utf-8?B?S3R6LzFTZnB5dHVydGUybzNtK2xIc2lqbHFzc0tKYURHb01zSUZSVEgwYXVo?=
 =?utf-8?B?VW5NNkFIZEpWOUsxVVpmbVVKa3lEVE9DSS9uZVg2SFZ4a3pwR3o5TlhUcHRT?=
 =?utf-8?B?OXFOZ0p4SUYzaGlncFFlZTBuQVdTRFo2YnlWeVZNYVkyYkp2ZS82aXEwc3pT?=
 =?utf-8?B?MS9xOFhuSk1RWmc4R1ByNEg4cGpWMnJVRjRFenJVTkNLVnBYSkEwTWw5dTZz?=
 =?utf-8?B?N2txcWRYOXg3WUZRWnRVZktkMGsxN1YzODJQdWhYTldwR1oyM1JUZVNXTW9H?=
 =?utf-8?B?Ukd2MHZiczhFTDRtNW1UbnNDL2pnWUhOVFNRZlVacUpScTU5S2dZeWE5bDJJ?=
 =?utf-8?B?ZlpWNUNHd09NbzNvRHFQMFhYdmZ5dWtOYzRUS0N1MllySXpGY25GUWZtZVhm?=
 =?utf-8?B?dll1M2RPbXIrNTd1NHk3MUhydis5VmpER1QraTZ6a3VaYTJpTFFMVzc5Z3BI?=
 =?utf-8?B?Um8vcTQ0RHBEOUc5NTg0djN6UFJ3akFvZmwxK1FlSzlUNlhKWWFoTEFTM2xn?=
 =?utf-8?B?SGtKdzhMQlN4S2E2M2V4Z05MUDVxUmVRZ21CWnhJYnhITDZySHRMUlBDcWky?=
 =?utf-8?B?dmR6b1ovK0pmako2dlJEcEdGWEpGSm1pY0FoWExxMm53Yjgxd2hzNTBCNk9h?=
 =?utf-8?B?SmVobmZVblN5aTRDTUdJelNTNm04WXR0T2gxMk5LRzg2dFp2Tks0VWVXSDhs?=
 =?utf-8?B?czhKWHh4ZG00ZU5ISkF6WGRtU3lRNDFyN1JORDRoY01rK0h0UmN3UDJtbWNp?=
 =?utf-8?B?Y2Z3ejc5SytWSDk5T25TM1h1YVpCWVlIajU5NlVDRTZKZW9rallnRXZBZm1X?=
 =?utf-8?B?cGw0NTE1UjkwMFNCSW9BNTdXRlZkRVo0OUduR2RUMGFoVWUzc2hBSUMybWpW?=
 =?utf-8?B?azlrOEJRbmxQamZ3OEhmL2hwMllmOWdlOURXV2tFa3BWaVVLRktNUHo5eE95?=
 =?utf-8?B?RFVQenBNV3FNWklqT3N3U0o3N0FSSlRYRzJJMVlYY1BQc2ZhQXowS0gvUThM?=
 =?utf-8?B?TDVTK1VRL3l2bnZ2RzhNK2wvSTluR3RZcW5nNStTT3R4eXpaU2Z6ZkZiMmxR?=
 =?utf-8?B?dEltd3A1NjRKL0RabnY3Qy84WWk3S1p1REVhUFdHQzhNWUNkSXoxeXZTQ3I1?=
 =?utf-8?B?b1VzUk1TNVVXZVd2SXBia1JmQjdPT2I4MzlOdUp4aFhMUTN6MzhEQUhwcXFX?=
 =?utf-8?B?Qkw3ZWFFYlIyMDFtV1JLcnZpQmxtOFVoSTV5bmxjb0czMlE3RWppYUV4dFlh?=
 =?utf-8?B?S1RKeUdnVWFad0NZQlFadFJlYVB0WUF3MW9wb1pKbVQwVFNzY3haWG41ODhK?=
 =?utf-8?B?bkJpS041bVJ6aDQ2V3RNbllQWFdrbWRhdjNWM1l3cUU2bTM2L29yS3JLQU11?=
 =?utf-8?B?akE1REUyTWo0QW5rUmZqdDVzU2RnNUplano1WWdHRnkxcFprQjA4OWN1RTc1?=
 =?utf-8?B?bmcwYTU2STh4WEpsT2JpczN4Q2tMSndpVWFjWEIyMkJIN2lOTDlLM3RwZ1FY?=
 =?utf-8?Q?Yf0s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dfb417-d101-47e1-a9a4-08dbd3d7daa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 14:53:44.2463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OsyZZiLeYdl/mZ8RWqAGoDegOG9Nmc4aeyDbFbK+MzH4rQdW04eIDC6+Z+1IM9lVFITiBdd2AtXnwSYAEdNoIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7292
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

PiBGcm9tOiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5
LCBPY3RvYmVyIDIzLCAyMDIzIDc6NTggUE0NCiANCj4gT24gTW9uLCBPY3QgMjMgMjAyMywgUGFy
YXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+ID4+IEZyb206IHZpcnRp
by1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+ID4+IDx2aXJ0aW8tY29tbWVudEBsaXN0
cy5vYXNpcy0gb3Blbi5vcmc+IE9uIEJlaGFsZiBPZiBDb3JuZWxpYSBIdWNrDQo+ID4+IFNlbnQ6
IE1vbmRheSwgT2N0b2JlciAyMywgMjAyMyA3OjI3IFBNDQo+ID4NCj4gPj4gV2VsbCwgdGhlcmUg
YXJlICBzdGlsbCBjb21tZW50cyBmcm9tIG1lIGhlcmUgdGhhdCBwb3N0LWRhdGUgdjQNCj4gPj4g
KHBsZWFzZSB3YWl0IGZvciBhIGJpdCBiZWZvcmUgcG9zdGluZyBhbm90aGVyIHZlcnNpb24hKSwg
c28gSSdsbA0KPiA+PiBjb250aW51ZSB3YWl0aW5nIGZvciB0aGVtIHRvIGJlIGFkZHJlc3NlZCBm
aXJzdC4NCj4gPiBUaGUgbGFzdCBvbmUgd2FzIFsxXS4NCj4gPiBXaGljaCBJIHJlcGxpZWQgZmV3
IGRheXMgYWdvIGF0IFsyXS4NCj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vbGlzdHMub2FzaXMt
b3Blbi5vcmcvYXJjaGl2ZXMvdmlydGlvLWNvbW1lbnQvMjAyMzEwL21zZzAwMjQwLmgNCj4gPiB0
bWwgWzJdDQo+ID4gaHR0cHM6Ly9saXN0cy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8t
Y29tbWVudC8yMDIzMTAvbXNnMDAyNDIuaA0KPiA+IHRtbA0KPiANCj4gSSBzdGlsbCBoYXZlIHNv
bWUgb3BlbiBxdWVzdGlvbnMgZnJvbSA8ODdzZjY4Y2puMC5mc2ZAcmVkaGF0LmNvbT4gKGZpcnN0
IGFuZA0KPiBsYXN0IHBhcmFncmFwaC4pDQoNCkFib3ZlIGxpbmsgaXMgbm90IGFjY2Vzc2libGUg
dG8gbWUuIOKYuQ0KSSBhZGRyZXNzZWQgeW91ciBjb21tZW50cy9xdWVzdGlvbnMgaW4gdjQuDQpD
YW4geW91IHBsZWFzZSBjaGVjayB2NCBpZiB0aGV5IGFyZSBhZGRyZXNzZWQ/IEkgcmV3cm90ZSBh
cyB5b3Ugc3VnZ2VzdGVkIGluIHYzLg0KDQo=

