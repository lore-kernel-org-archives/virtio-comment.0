Return-Path: <virtio-comment-return-7923-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391FBC001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 15:21:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8B67C77E91
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 15:21:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 63D6F98697E
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 15:21:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4977A986697; Mon, 23 Oct 2023 15:21:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36642986699
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 15:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DD9KyomYiOPfhF0Prul1YGkAORBcMwHkeMd2iK/iG/GIVVX1r/SEJlc67c4botnYAuMqHC+1qbTU3qJdpm4Id029VXJcguXQ4FSzB1CPc800xAb15dtHKf0r78ZypwyMW08M/gLK4bYQlj3/TQNF720yj0CJh6Yxu8LC5ygyDcX6UmCxdqeuzaW73QQs3SlJZ0ODVTGeOGd84T5il+kAhU0mMAVONMjnxjTD25/QQUjn1lZGAdab0n5mBfSGcqJ40Eu4bm1u9yZbF6ovZw7mZf+79/lrPZ4PJ+vmG5AJwTbwZjymVrq9RB3FSj5B2wQoVq51aX5jIgVu4TAiNmRcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8z+LwNvQXK70918vBCURCxwPgtSfMDohbv47a5t4S4k=;
 b=h4KxWgiN+c6SP++7obIkOkvlZIRFXkdoWHYXZiJjAP1ClzLe+JCxwXR+xYVOR2fOt9AmptjcqI5OIb/GlqQY8/4Cboen8U224zMDlmTMjuEVgA9ZNMhZqZfGIMO57OZNlrpzW8ulXfOIO9XrluRg4pMpa3Ok7sPzaM3/pXwCl+u+aIz7TA1Rx8SRO0RVDFCIupBmWBIHHF3YafxE0hUto3qB+VZRNEj73kScdeESlYTYnuWZwZapJGECfeboj/efuKUc4+ZjTRQnpgb9FZVstXppvyShmnlAUqw2e83ZFO6BXIfHnWyoX0nimWtlIgczwJghvLzMvYuVLtF2UVulwg==
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
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbA=
Date: Mon, 23 Oct 2023 15:21:47 +0000
Message-ID:
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
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
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
In-Reply-To: <87ttqhbcy7.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8585:EE_
x-ms-office365-filtering-correlation-id: f2129683-fbc1-47f5-5e81-08dbd3dbc640
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZD72yw5ATUranJbmX6grNOHxzPTC9u3z626sdxnCtYL0QDRtYkykMKG4Z4lXr35Ou1sLBcaWkAq/pP+/HXWwVmY90kvRGI/cLA09prFfVxw/9C6wXMlapefv2HPjs12kMbQA5hf0Nu4tC2wsEJARbcrYX3XjxNPp7uF+Ye7eLq7u33PorzRntZOvFfTN0Mr7Ito3xpq1h3Bt0+D4iPaoWtg3XmrweMzZTuZmgCGSM82r2lztWevJBq6StqCC7yOa74UFnYN0hQgSFHyI08uxLWcgzh3Pv2WKY2V/PR90e6S2ylI/JA/RzHbVska2Wevtx54ZFWxK8W8uzJHPFammGSkH2G6EZKQGc3IpffLuyONJSD1nr46IoO8Ct2raDOexIJhLs/QPLP2/rFupErTr3K8zL434XTmK8TcK2HNDM6DV1WGXdRTOGB6NDLEamlvH7IJVaR6kZyb0i4n8RYIzAj0JwM8ZhCZsYMYh6G6hMSWQAzA05QnwJgOzIWQtfm9QcOuOyGH7NLxDPkrZc2ee3jklRUFRVvQkQZ2B0v8wOgkKpOdZ/wx6FptgBwuw/saQ3krSN7GLYjmv/K3i8Pa5kmuC84cAvIC67Z06VOXKxX4XPgnBXfoPKnjpSnLrPV7JnQQ1hDmcjRPWmhmC9tBi94uDM3/ZWyShW7jH9p0laDxMQtyQr8bk/4HMSqQcHX9kTEgVSJunmkKk1lpv5nehwA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(966005)(478600001)(5660300002)(41300700001)(4326008)(8936002)(52536014)(8676002)(76116006)(110136005)(55016003)(316002)(54906003)(64756008)(66946007)(66476007)(66446008)(66556008)(83380400001)(33656002)(38100700002)(86362001)(38070700009)(122000001)(55236004)(71200400001)(26005)(7696005)(6506007)(107886003)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjlFOXFqSTdub1FCNVNicFJ3KzkvY3ZoUE1QTk1yZHRjRi9zZitUUXVjNU40?=
 =?utf-8?B?TUpBUHVUc0hZOFJuUmM3eFRYbldHZnFJNFRJamE5U2o3bEJwVmc0S2s1R0dF?=
 =?utf-8?B?K2Q1aFU4ZWFQTjhBVWFmbTFlYUVhaXhQUks3R1ZKY0sxSmt2QUJvR1BxblZC?=
 =?utf-8?B?N3FiZEU5VHBXTi9KYlYweGordGFnY2J5amRNc0k1RVROb0JTK3c4SkJnaXR4?=
 =?utf-8?B?WERIT28xL1FGZXVGUTdTODlLN0xCWmFKSjl1eEladjBkbm5iT2Nma0l2a1k2?=
 =?utf-8?B?UTlCekVVV0trL0xUYXJydzZCNjRrdXlES2E3b3JXdklSQmoyVXdQSGFiempp?=
 =?utf-8?B?U0hqVDZJQkQ5RDI1MTZxdzd5ZjAxQ3Zpc3VlTmhQaEttS1cycXNnTll5OUVy?=
 =?utf-8?B?a1c0YXNzbjQ4UUgzMlptSXFtYzdSNm05enVhOXd0MUFwUVU3d2FkSjJBZHhm?=
 =?utf-8?B?MDU3MUhvaUFJWGZpd3NpbEVTWWtnQU1lQ0JiTVYvM2hCckpRZGdvSnNuNW1N?=
 =?utf-8?B?VHY5ZTUvbkdXRElFSldQQUh3NEpTeHdwQ1p5VlRaMEtiUlFFNDVxenQxK3dP?=
 =?utf-8?B?eUlqZE00ZFRWN21KVkl2QnFWb2t3ckVGalZxZGNqOENjcGptK1BrdjVnRmRz?=
 =?utf-8?B?SDRvd1pjS1JwUTF6QzYvQmx4Vm8ybUVpWXUvRUJTZDY2UTk1c0Y5dzMyZ1hD?=
 =?utf-8?B?UGVOOTZpanFNODMvWGpjZS9BYnhQbzlveXZNV0dPNzR2YWxza0VCWWxFWkg5?=
 =?utf-8?B?bkhUcERIQWE1UVlXNWtZWVBicU9jMDR5bnFUUGhPREM4bUJxMUtLdGtDMGZX?=
 =?utf-8?B?TXNaUGtJZVhIK3JXY3dLd0h1YVlhYlNwSzlkZGJ2MG13bjVqdnhUZlFZSytH?=
 =?utf-8?B?YmIydHZvUzZxRE1XSTRMaEp4T25QaHppWW9aZUYxYk5FRWZxZUw4ZEkxNFlN?=
 =?utf-8?B?bldQRFlMUXB0K2IxUi9DODNYY1BEa1JUZXhOUmNXQkd0RHBRaFFIMkg5RVd0?=
 =?utf-8?B?THhOTmdpMnVzU3hWVDZJMC8xVU4rMzRFejM4VXlqaWFRSEhISUl5R2tZOGlm?=
 =?utf-8?B?SzRNd1FqRGdHcmRlZU83MytnQmZVc2U4ODN4am01ZW12d2hkQzlKd0drcTFw?=
 =?utf-8?B?MGR6RU5xZC9kbEhLU0R4Q05tU0dyT1puSFhxVkQ2RnhiVUpEa094eEdMZkRT?=
 =?utf-8?B?eHIwd0p1S2lweStQNFU5cDJNZkZab3Z0Y3l1RnI1UE02Qmw3ZHRBOEFjZWNI?=
 =?utf-8?B?Q2dndEVpS3paeTY3dEFpR3l3ZGg1QU9oU2RjdHBwak4rN1RRUUVRQ0xZb2I5?=
 =?utf-8?B?dEFSOS9FS3hyYS9Fb012K0hjdzhNS1l4V3Mwd08vYjVkZGZ4cWp1WmQ0UG9u?=
 =?utf-8?B?by9IUnFGRGVvYjdkL0RvZkxpU2ZhMkd1MDJQNlhmMFBwTDBhQVREYTRlRVpP?=
 =?utf-8?B?VDF1cWgyRmVlTzlRSDlZZW8zZzB5WE9hTjlWWTlxblFtUTVERjEzNGNyaDlv?=
 =?utf-8?B?YWNqbE5JejBqdy8xeFZ4cUlIZWlORlJtQkxHWmhESnYycFV3Qks2Qjl0NmJO?=
 =?utf-8?B?TGIrVjQwZDFONU1ydko0Z3pzN2JJeEdUT0UwWDBPSmdxSDN5eGQ1OS9uVEdr?=
 =?utf-8?B?dEtMY2dhOWF4bkpKUHhMYXlhbzZUZ1JRYmFUSWE0MUIrNGsxWDZwMDZEakNl?=
 =?utf-8?B?dTFUaWtvZWh0SWNFSDluU2NmdlVObTJJU1J0c2RIengrNHFaeDZGR25jd0tU?=
 =?utf-8?B?VU5HSktBZi9ocFZuZXZCczQ0ZEdJQml0cXk2ekxqcm9XdTBHbkt5d2RIT2gy?=
 =?utf-8?B?WU4xMWRicFJqQlFNRTlMYURNeFY4WTJodlZqSks1Z255bmUzYW9iOTNwOGRa?=
 =?utf-8?B?dXRtRFNoVkZkNlBxTm1kLzV0dG9JSS9kbDhIR29aMXF0MjZ5N2oyb0JRQWp2?=
 =?utf-8?B?alJzNnZzYTZ1K3FEY1hOMDV1ZytmblBza1MyVWRteGl3dTZyZFViOURDMFg0?=
 =?utf-8?B?QjdwZDVHMXFLWkpJNFFxT1BUd1FiazJDUWIyeEVpT2UzWlBPRXdOTVVRNjZL?=
 =?utf-8?B?Z2JOclFMZG1Ga1FialdUVlc4b0pPdTkvWjRqOE1PWHIxNU44YmJSRXh1SytF?=
 =?utf-8?Q?W3Ns=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2129683-fbc1-47f5-5e81-08dbd3dbc640
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 15:21:47.9993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d4Ni+oF0R212dWzKGnY3UFS19gra0COulUTV5QJ7rAt6ZHkCIRW972YfhoEl1P69uUdsZAOTAP/4yewyJuNNWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8585
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

DQo+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnIDx2aXJ0aW8tY29t
bWVudEBsaXN0cy5vYXNpcy0NCj4gb3Blbi5vcmc+IE9uIEJlaGFsZiBPZiBDb3JuZWxpYSBIdWNr
DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyMywgMjAyMyA4OjMxIFBNDQo+IA0KPiBPbiBNb24s
IE9jdCAyMyAyMDIzLCBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiAN
Cj4gPj4gRnJvbTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+DQo+ID4+IFNlbnQ6
IE1vbmRheSwgT2N0b2JlciAyMywgMjAyMyA3OjU4IFBNDQo+ID4NCj4gPj4gT24gTW9uLCBPY3Qg
MjMgMjAyMywgUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4gPj4NCj4g
Pj4gPj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcNCj4gPj4gPj4g
PHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLSBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIENvcm5l
bGlhIEh1Y2sNCj4gPj4gPj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDIzLCAyMDIzIDc6MjcgUE0N
Cj4gPj4gPg0KPiA+PiA+PiBXZWxsLCB0aGVyZSBhcmUgIHN0aWxsIGNvbW1lbnRzIGZyb20gbWUg
aGVyZSB0aGF0IHBvc3QtZGF0ZSB2NA0KPiA+PiA+PiAocGxlYXNlIHdhaXQgZm9yIGEgYml0IGJl
Zm9yZSBwb3N0aW5nIGFub3RoZXIgdmVyc2lvbiEpLCBzbyBJJ2xsDQo+ID4+ID4+IGNvbnRpbnVl
IHdhaXRpbmcgZm9yIHRoZW0gdG8gYmUgYWRkcmVzc2VkIGZpcnN0Lg0KPiA+PiA+IFRoZSBsYXN0
IG9uZSB3YXMgWzFdLg0KPiA+PiA+IFdoaWNoIEkgcmVwbGllZCBmZXcgZGF5cyBhZ28gYXQgWzJd
Lg0KPiA+PiA+DQo+ID4+ID4gWzFdDQo+ID4+ID4gaHR0cHM6Ly9saXN0cy5vYXNpcy1vcGVuLm9y
Zy9hcmNoaXZlcy92aXJ0aW8tY29tbWVudC8yMDIzMTAvbXNnMDAyNA0KPiA+PiA+IDAuaA0KPiA+
PiA+IHRtbCBbMl0NCj4gPj4gPiBodHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVz
L3ZpcnRpby1jb21tZW50LzIwMjMxMC9tc2cwMDI0DQo+ID4+ID4gMi5oDQo+ID4+ID4gdG1sDQo+
ID4+DQo+ID4+IEkgc3RpbGwgaGF2ZSBzb21lIG9wZW4gcXVlc3Rpb25zIGZyb20gPDg3c2Y2OGNq
bjAuZnNmQHJlZGhhdC5jb20+DQo+ID4+IChmaXJzdCBhbmQgbGFzdCBwYXJhZ3JhcGguKQ0KPiA+
DQo+ID4gQWJvdmUgbGluayBpcyBub3QgYWNjZXNzaWJsZSB0byBtZS4g4pi5DQo+IA0KPiBUaGF0
J3Mgbm90IGEgbGluaywgYnV0IGEgbWVzc2FnZSBpZC4uLiBtYW55IG1haWwgY2xpZW50cyBzdXBw
b3J0IHNlYXJjaGluZyBieSBpdCwNCj4gYW5kIHlvdSBjYW4gYWxzbyBnZXQgaXQgZnJvbSBsb3Jl
Og0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzg3c2Y2OGNqbjAuZnNmQHJlZGhh
dC5jb20vDQo+IA0KPiA+IEkgYWRkcmVzc2VkIHlvdXIgY29tbWVudHMvcXVlc3Rpb25zIGluIHY0
Lg0KPiA+IENhbiB5b3UgcGxlYXNlIGNoZWNrIHY0IGlmIHRoZXkgYXJlIGFkZHJlc3NlZD8gSSBy
ZXdyb3RlIGFzIHlvdSBzdWdnZXN0ZWQgaW4NCj4gdjMuDQo+IA0KPiBUaGlzIHdhcyBmb3IgcG9p
bnRzIHlvdSBkaWQgbm90IGFncmVlIHdpdGguIChBZ2FpbiwgaXQgbWlnaHQgYmUgaGVscGZ1bCB0
byB3YWl0DQo+IHdpdGggcG9zdGluZyBhIG5ldyB2ZXJzaW9uIHVudGlsIGRpc2N1c3Npb24gaGFz
IHNvbWV3aGF0DQo+IGNvbmNsdWRlZC4pDQpTdXJlLCB3aWxsIHdhaXQgbmV4dCB0aW1lLiANCg0K
WW91ciBjb21tZW50IHdhcywNCj09PT09DQpUaGlzIGlzIG5vdCByZWFsbHkgY2xlYXIgdG8gbWUg
anVzdCBmcm9tIHRoaXMgdGV4dCwgZXNwZWNpYWxseSBpZiB5b3UNCmp1c3Qgd3JvdGUgYWJvdmUg
dGhhdCBlbmFibGluZyBvciByZS1lbmFibGluZyBpcyBzb21ldGhpbmcNCmRpZmZlcmVudC4uLiBt
eSB1bmRlcnN0YW5kaW5nIHdvdWxkIGJlOg0KDQotIGlmIG5laXRoZXIgZHluYW1pYyB2cXMgbm9y
IHF1ZXVlIHJlc2V0IGFyZSBzdXBwb3J0ZWQgb3IgbmVnb3RpYXRlZCwNCiAgdGhlIG9ubHkgd2F5
IHRvIGVuYWJsZSBhIHZxIGlzIGJlZm9yZSBEUklWRVJfT0ssIGR1cmluZyBzZXR1cA0KLSBib3Ro
IG9mIHRoZXNlIGZlYXR1cmVzIHJlbHkgb24gdGhlIHRyYW5zcG9ydCBzdXBwb3J0aW5nIGVuYWJs
aW5nDQogIGluZGl2aWR1YWwgcXVldWVzIChlaXRoZXIgYSBxdWV1ZSB0aGF0IGhhcyBub3QgYmVl
biBlbmFibGVkIGJlZm9yZSwgb3INCiAgYSBxdWV1ZSB0aGF0IGhhcyBiZWVuIHJlc2V0KQ0KLSB0
aGUgdHJhbnNwb3J0IGlzIHN1cHBvc2VkIHRvIHVzZSB0aGUgc2FtZSBtZWNoYW5pc20gZm9yIGVp
dGhlcg0KDQpEaWQgSSBnZXQgaXQgcmlnaHQ/IElmIHNvLCBJIHRoaW5rIHdlIHNob3VsZCBtYWtl
IGl0IGEgYml0IG1vcmUgY2xlYXIuDQo9PT09PQ0KDQpBYm92ZSBpcyBjbGFyaWZpZWQgaW4gYmVs
b3cgd29yZGluZyB3aXRob3V0IGNvbXBsaWNhdGluZyB0aGUgcXVldWVfcmVzZXQgaGVyZS4NCg0K
RG9lcyB0aGF0IGxvb2sgb2sgdG8geW91Pw0KDQorV2hlbiBWSVJUSU9fRl9SSU5HX0RZTkFNSUMg
aXMgbm90IG5lZ290aWF0ZWQsIHRoZSBkcml2ZXIgZW5hYmxlcyB0aGUgdmlydHF1ZXVlcw0KK2R1
cmluZyB0aGUgZGV2aWNlIGluaXRpYWxpemF0aW9uIHNlcXVlbmNlLCBpLmUuIGFmdGVyIHRoZSBk
ZXZpY2Ugc2V0cyB0aGUNCitGRUFUVVJFU19PSyBzdGF0dXMgYml0IGFuZCBiZWZvcmUgdGhlIGRy
aXZlciBzZXR0aW5nIHRoZSBEUklWRVJfT0sgc3RhdHVzIGJpdC4NCisNCitXaGVuIFZJUlRJT19G
X1JJTkdfRFlOQU1JQyBpcyBuZWdvdGlhdGVkLCB0aGUgZHJpdmVyIGlzIG5vdCByZXF1aXJlZCB0
byBlbmFibGUNCitldmVyeSB2aXJ0cXVldWUgaXQgd2FudHMgdG8gdXNlIGJlZm9yZSBzZXR0aW5n
IHRoZSBEUklWRVJfT0sgc3RhdHVzIGJpdDsgdGhlDQorZHJpdmVyIGNhbiBjaG9vc2UgdG8gZW5h
YmxlIGEgdmlydHF1ZXVlIGV2ZW4gYWZ0ZXIgdGhlIGRyaXZlciBoYXMgc2V0IHRoZQ0KK0RSSVZF
Ul9PSyBzdGF0dXMgYml0LiBUaGUgdmlydHF1ZXVlIGVuYWJsZSBtZWNoYW5pc20gaXMgdHJhbnNw
b3J0IHNwZWNpZmljLg0KKw0K

